import 'package:flutter/material.dart';
import 'package:travel_app/ui/home.dart';
import 'package:travel_app/ui/introduction.dart';
import 'package:travel_app/ui/login.dart';
import 'package:travel_app/ui/register.dart';
import 'package:travel_app/ui/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'flutter demo',
            debugShowCheckedModeBanner: false,
            initialRoute: '/intro',
            routes: {
              '/': (context) => const Home(),
              '/splash': (context) => const SplashScreen(),
              '/intro': (context) => const Introduction(),
              '/register': (context) => const Register(),
              '/login': (context) => const Login(),
            },
          );
        }
        return const SplashScreen();
      },
    );
  }
}
