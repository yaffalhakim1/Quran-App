import 'package:flutter/material.dart';
import 'package:quran_app/pages/main_page.dart';
import 'package:quran_app/shared/themes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBgColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quran App',
                style: kTitleTextStyle.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                'Learn Quran and\nRecite once everyday',
                style: kSubtitleTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Image.asset(
                'assets/quran.png',
                height: 400,
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => MainPage())));
                },
                child: Container(
                  width: 185,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xffF9B091),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: kSemiboldTextStyle.copyWith(color: kBgColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
