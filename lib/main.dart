import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:travel_app/controller/auth_controller.dart';
import 'package:travel_app/ui/home.dart';
import 'package:travel_app/ui/introduction.dart';
import 'package:travel_app/ui/login.dart';
import 'package:travel_app/ui/register.dart';
import 'package:travel_app/ui/splashscreen.dart';

Future main() async {
  await dotenv.load(fileName: '.env');

  bool isAuthenticated = await AuthController().isAuthenticated();

  runApp(MyApp(isAuthenticated: isAuthenticated));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isAuthenticated});

  final bool isAuthenticated;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'flutter demo',
            debugShowCheckedModeBanner: false,
            initialRoute: isAuthenticated ? '/' : '/intro',
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
