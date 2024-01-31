import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:travel_app/ui/home.dart';
import 'package:travel_app/ui/introduction.dart';
import 'package:travel_app/ui/login.dart';
import 'package:travel_app/ui/register.dart';
import 'package:travel_app/ui/splashscreen.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
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
              '/intro': (context) => const Introduction(),
              '/splash': (context) => const SplashScreen(),
              '/login': (context) => const Login(),
              '/register': (context) => const Register()
            },
          );
        }
        return const SplashScreen();
      },
    );
  }
}
