import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/constants/enviroment.dart';
import '../widgets/custom_text_form.dart';

class HomeScreen extends StatefulWidget {

  final String usuario;

  HomeScreen(this.usuario, {super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dio = Dio(
    BaseOptions(
      baseUrl: Enviroment.apiUrl,
    )
  );
  
  final etiquetaB = TextEditingController();
   String message = '';

  final etiquetaV = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future sendData() async {
    
    if(etiquetaB.text.isEmpty || etiquetaV.text.isEmpty){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
            title: Text("Error"),
            content: Text("Por Favor Completa los Campos"),
            actions: [
              TextButton(
              child: Text("Aceptar"),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              ),
            ],
            );
          },
        );
    } else {
      final res = await dio.post("/proses_api.php", data: {
        "aksi": "saveBMW",
        "etiquetaB": etiquetaB.text,
        "etiquetaV": etiquetaV.text,
        "username": widget.usuario
      }); 

    //print( res.data);
      final Map<String, dynamic> data = jsonDecode(res.data);
      message = data['status'].toString();
      print(message);
      if(message == 'Success'){
        etiquetaB.clear();
        etiquetaV.clear();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
            title: Text("Success"),
            content: Text("El registro se ha realizado con éxito."),
            actions: [
              TextButton(
              child: Text("Aceptar"),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              ),
            ],
            );
          },
        );
      } else if(message == 'Error') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
            title: Text("Error"),
            content: Text("Por Favor revisa que las etiquetas sean las correctas."),
            actions: [
              TextButton(
              child: Text("Aceptar"),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              ),
            ],
            );
          },
        );
      } else if( message == 'Existe'){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
            title: Text("Warning"),
            content: Text("Ya se ingreso un registro con estos datos, favor de ingresar nuevos datos."),
            actions: [
              TextButton(
              child: Text("Aceptar"),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              ),
            ],
            );
          },
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xff364461),
            foregroundColor: const Color(0xffe0e4ce), //Color de letra
            centerTitle: true,
            title: const Text("Escaner Etiquetas", style: TextStyle(fontSize: 21),),
           actions: [
              IconButton(
                icon: const Icon(Icons.logout), // Icono de logout
                onPressed: () {
                  // Aquí puedes manejar la lógica de cierre de sesión
                   _logout(context);
                },
              ),
            ],
          ),
          body: Form(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.03),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          height: 200,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.03),
                            child: TextFormFields(
                              controller: etiquetaB,
                              labelText: 'Etiqueta Blanca:',
                              icono: const Icon(Icons.label_important),
                              oscureText: false,
                              hint: 'PAL*********',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.help_outline),
                          onPressed: () {
                            _showEB(context);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.03),
                            child: TextFormFields(
                              controller: etiquetaV,
                              labelText: 'Etiqueta Verde:',
                              icono: const Icon(Icons.label_important),
                              oscureText: false,
                              hint: '4000***********'
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.help_outline),
                          onPressed: () {
                            _showEV(context);
                          },
                        ),
                        
                      ],
                    ),
                    const SizedBox(
                          height: 80,
                        ),
                        Wrap(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton.icon(
                              onPressed: sendData,
                              label: const Text('Save'),
                              icon: const Icon(Icons.save),
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Color(0xff3a4270)),
                              ),
                              ),
                            ),
                          ],
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  
  void _logout(BuildContext context) {
    // Lógica para cerrar sesión
    // Por ejemplo, puedes mostrar un diálogo de confirmación o redirigir a la pantalla de inicio de sesión
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Cerrar Sesión"),
          content: const Text("¿Estás seguro de que deseas cerrar sesión?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
            ),
            TextButton(
              child: const Text("Aceptar"),
              onPressed: () {
                // Aquí puedes agregar la lógica para cerrar sesión
                // Por ejemplo, limpiar el token de sesión y redirigir a la pantalla de inicio de sesión
                context.push('/'); // Cierra el diálogo
                // Redirigir a la pantalla de inicio de sesión
                // Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        );
      },
    );
  }

  void _showEB(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Text("Example"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/etb.jpeg', width: 250, height: 250), // Cambia a tu imagen
                SizedBox(height: 10),
              ],
            ),
            actions: [
              TextButton(
                child: Text("Cerrar"),
                onPressed: () {
                  Navigator.of(context).pop(); // Cierra el diálogo
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEV(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Text("Example"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/etv.jpeg', width: 250, height: 250), // Cambia a tu imagen
                SizedBox(height: 10),
              ],
            ),
            actions: [
              TextButton(
                child: Text("Cerrar"),
                onPressed: () {
                  Navigator.of(context).pop(); // Cierra el diálogo
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

