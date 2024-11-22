import 'package:demoproject/bloc/cart_bloc.dart';
import 'package:demoproject/bloc/product_bloc.dart';
import 'package:demoproject/view/dashboard/dashboard.dart';
import 'package:demoproject/view/login/login_screen.dart';
import 'package:demoproject/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => ProductBloc()),
      BlocProvider(create: (context) => CartBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/dashboard',
      routes: {
        '/splashScreen': (context) => const SplashScreen(),
        '/loginScreen': (context) => const LoginScreen(),
        '/dashboard': (context) => const Dashboard(),
      },
    );
  }
}
