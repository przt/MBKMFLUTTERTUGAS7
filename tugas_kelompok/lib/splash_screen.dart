import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tugas_kelompok/colors_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, '/article_list'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              color: Palette.textColor1,
            ),
          ),
        ],
      ),
    );
  }
}
