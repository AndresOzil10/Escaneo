import 'package:flutter/material.dart';
import '../widgets/login_form.dart';

const colors = [
  Color(0xff373A40),
  Color.fromARGB(255, 255, 255, 255),
];

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SizedBox(
          width: double.infinity, //TO DO el ancho de la pantalla
          height: double.infinity, // TO DO el alto de la pantalla
          child: Stack(
            // Conjunto de Widgets, Colocar un widget encima de otro
            children: [_Fondo(size: size), const _Icon(), const Desing()],
          ),
        ),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        width: double.infinity,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final imageSize = constraints.maxWidth * 0.2; // Adjust size based on screen width
            return Image.asset(
              'assets/images/logo1.png',
              width: imageSize,
              height: imageSize,
            );
          },
        ),
      ));
  }
}

class _Fondo extends StatelessWidget {
  const _Fondo({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: LinearGradient(colors: colors)),
      width: double.infinity,
      height: size.height * 0.1,
      child: Stack(
        children: [
          Positioned(top: -40, left: -30, child: Burbuja()),
          Positioned(top: 90, left: 30, child: Burbuja()),
          Positioned(top: 250, left: -30, child: Burbuja()),
          Positioned(top: 350, left: 40, child: Burbuja()),
          Positioned(top: 30, left: 150, child: Burbuja()),
          Positioned(top: 220, left: 130, child: Burbuja()),
          Positioned(top: 350, left: 200, child: Burbuja()),
          Positioned(top: -40, left: 280, child: Burbuja()),
          Positioned(top: 130, left: 250, child: Burbuja()),
          Positioned(top: 260, left: 300, child: Burbuja()),
          Positioned(top: 350, left: 400, child: Burbuja()),
          Positioned(top: 150, left: 400, child: Burbuja()),
          Positioned(top: 0, left: 450, child: Burbuja()),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container Burbuja() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(214, 214, 214, 0.315)),
    );
  }
}

