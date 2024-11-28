import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pill_mate/onboarding/onboarding_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 5 saniye bekleyip onboarding ekranına geçiş yapıyoruz
    Timer(Duration(seconds: 7), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => OnboardingView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Arka plan resmi
          Image.asset(
            "assets/splash.jpg",
            fit: BoxFit.cover,
          ),
          // Ortadaki isim
          Center(
            child: Text(
              "HAPÇI",//PillMate
              style: TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[200],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
