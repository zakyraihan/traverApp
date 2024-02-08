import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/ui/home.dart';
import 'package:travel_app/ui/introduction.dart';
import 'package:travel_app/ui/login.dart';
import 'package:travel_app/ui/register.dart';
import 'package:travel_app/ui/splashscreen.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? intro;
  String? isLogin;

  cekData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getBool('ISINTRO') != null) {
        intro = prefs.getBool('ISINTRO');
      }
      if (prefs.getString('TOKEN') != null) {
        isLogin = prefs.getString('TOKEN');
      }
    });
  }

  @override
  void initState() {
    cekData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: intro == null || intro == false
                ? '/intro'
                : isLogin == null || isLogin == false
                    ? '/login'
                    : '/',
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
