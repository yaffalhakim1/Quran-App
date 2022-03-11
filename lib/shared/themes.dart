import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color kBgColor = const Color(0xff091945);
Color kHighlightColor = const Color(0xffA44AFF);
Color kGreyColor = const Color(0xff7B80AD);

TextStyle kTitleTextStyle = GoogleFonts.poppins(
  textStyle: const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  ),
);
TextStyle kSubtitleTextStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: kGreyColor,
  ),
);
TextStyle kMediumTextStyle = GoogleFonts.poppins(
  textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
);
TextStyle kSemiboldTextStyle = GoogleFonts.poppins(
  textStyle: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  ),
);
