import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  static TextStyle regular12 = _textStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
  static TextStyle regular14 = _textStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
  static TextStyle regular16 = _textStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
  static TextStyle regular18 = _textStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
  static TextStyle regular20 = _textStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
  static TextStyle regular24 = _textStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
  static TextStyle regular28 = _textStyle(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
  static TextStyle regular32 = _textStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
  static TextStyle regular36 = _textStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );

  static TextStyle medium12 = _textStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
  static TextStyle medium14 = _textStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
  static TextStyle medium16 = _textStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
  static TextStyle medium18 = _textStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
  static TextStyle medium20 = _textStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
  static TextStyle medium24 = _textStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
  static TextStyle medium28 = _textStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
  static TextStyle medium32 = _textStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
  static TextStyle medium36 = _textStyle(
    fontSize: 36,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );

  static TextStyle bold12 = _textStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.bebasNeue().fontFamily,
  );
  static TextStyle bold14 = _textStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.bebasNeue().fontFamily,
  );
  static TextStyle bold16 = _textStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.bebasNeue().fontFamily,
  );
  static TextStyle bold18 = _textStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.bebasNeue().fontFamily,
  );
  static TextStyle bold20 = _textStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.bebasNeue().fontFamily,
  );
  static TextStyle bold24 = _textStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.bebasNeue().fontFamily,
  );
  static TextStyle bold28 = _textStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.bebasNeue().fontFamily,
  );
  static TextStyle bold32 = _textStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.bebasNeue().fontFamily,
  );
  static TextStyle bold36 = _textStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.bebasNeue().fontFamily,
  );

  static TextStyle _textStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }
}
