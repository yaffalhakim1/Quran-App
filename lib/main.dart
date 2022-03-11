import 'package:flutter/material.dart';
import 'package:quran_app/pages/detail_surah.dart';
import 'package:quran_app/pages/main_page.dart';
import 'package:quran_app/pages/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
