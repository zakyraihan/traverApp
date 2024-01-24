// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: '',
              bodyWidget: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Image.asset(
                        'assets/img/white-traver.png',
                        height: 50,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Let's explore the world",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 55, color: Colors.white, height: 1.2),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Let's explore the world with just a few clicks",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              image: Stack(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/img/page1.jpg'),
                            fit: BoxFit.cover),
                      )),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black54],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                  ),
                ],
              ),
              decoration: const PageDecoration(
                fullScreen: true,
                titlePadding: EdgeInsets.only(bottom: 0),
                bodyFlex: 1,
              ),
            ),
            PageViewModel(
              title: '',
              bodyWidget: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Image.asset(
                        'assets/img/white-traver.png',
                        height: 50,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Visit tourist attraction",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Find thousands of tourist destinations ready for you visit",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              image: Stack(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/img/page2.jpg'),
                            fit: BoxFit.cover),
                      )),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black54],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                  ),
                ],
              ),
              decoration: const PageDecoration(
                fullScreen: true,
                titlePadding: EdgeInsets.only(bottom: 0),
                bodyFlex: 1,
              ),
            ),
            PageViewModel(
              title: '',
              bodyWidget: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Image.asset(
                        'assets/img/white-traver.png',
                        height: 50,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Get ready for next trip",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 60, color: Colors.white, height: 1.2),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Let's Goo, start trip",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              image: Stack(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/img/page3.jpg'),
                            fit: BoxFit.cover),
                      )),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black54],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                  ),
                ],
              ),
              decoration: const PageDecoration(
                fullScreen: true,
                titlePadding: EdgeInsets.only(bottom: 0),
                bodyFlex: 1,
              ),
            ),
          ],
          showSkipButton: true,
          skip: const Text('Skip', style: TextStyle(color: Colors.white)),
          next: const Text('Next', style: TextStyle(color: Colors.white)),
          done: const Text(
            'Done',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
          onDone: () =>
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
          onSkip: () =>
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(50.0, 10.0),
            activeColor: const Color.fromARGB(255, 224, 214, 214),
            color: const Color.fromRGBO(255, 255, 255, 1),
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
