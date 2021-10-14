import 'package:flutter/material.dart';
import 'package:tugas_kelompok/colors_config.dart';
import 'package:tugas_kelompok/login_page.dart';
import 'package:tugas_kelompok/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Palette.backgroundColor,
      ),
      home: MainPage(),
    );
  }
}
