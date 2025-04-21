import 'package:go_router/go_router.dart';

import '../../screens/home_screen.dart';
import '../../screens/login_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    //name: LoginScreen.name,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/home',
    //name: LoginScreen.name,
    builder: (context, state) => HomeScreen('id'),
  ),
  // GoRoute(
  //   path: '/register',
  //   //name: LoginScreen.name,
  //   builder: (context, state) => const RegisterScreen(),
  // ),
  // GoRoute(
  //   path: '/details',
  //   //name: LoginScreen.name,
  //   builder: (context, state) =>  InfoScreen('text'),
  // ),
  // GoRoute(
  //   path: '/add',
  //   //name: LoginScreen.name,
  //   builder: (context, state) =>  AddEquipment(),
  // ),
  // GoRoute(
  //   path: '/asignar',
  //   //name: LoginScreen.name,
  //   builder: (context, state) => AsignarEquipoScreen(),
  // ),
  // GoRoute(
  //   path: '/infoC',
  //   //name: LoginScreen.name,
  //   builder: (context, state) => const InfScreen(),
  // ),
  // GoRoute(
  //   path: '/infoP',
  //   //name: LoginScreen.name,
  //   builder: (context, state) => const InfScreenP(),
  // ),
  // GoRoute(
  //   path: '/infoS',
  //   //name: LoginScreen.name,
  //   builder: (context, state) => const InfScreenS(),
  // ),
  // GoRoute(
  //   path: '/maintenace',
  //   //name: LoginScreen.name,
  //   //  builder: (context, state) =>  const AddMaintenance(),
  //   builder: (context, state) => const CalendarScreen(),
  // ),
  // GoRoute(
  //   path: '/tonner',
  //   //name: LoginScreen.name,
  //   //  builder: (context, state) =>  const AddMaintenance(),
  //   builder: (context, state) => TonnerScreen(),
  // ),
]);
