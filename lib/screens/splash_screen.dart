// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
//
import 'package:app_examples/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double scale = 1.0;
  double opacity = 1.0;

  double getHeight() => 200 * scale;

  double getWidth() => 200 * scale;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => setState(() {
          scale = 5.0;
          opacity = opacity - 1.0;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            height: getHeight(),
            width: getWidth(),
            top: size.height / 2 - getHeight() / 2,
            left: size.width / 2 - getWidth() / 2,
            duration: const Duration(seconds: 2),
            child: AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(seconds: 2),
                child: Image.asset('assets/venom.png', fit: BoxFit.contain)),
            onEnd: () => Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (_, animation, __) => FadeTransition(
                  opacity: animation,
                  child: HomeScreen(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
