import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: SplashScreen.routeName,
        // routes: {
        //   LoginScreen.routeName: (context) => const LoginScreen(),
        //   GameScreen.routeName: (context) => const GameScreen(),
        //   SplashScreen.routeName: (context) => const SplashScreen(),
        // },
    );
  }
}