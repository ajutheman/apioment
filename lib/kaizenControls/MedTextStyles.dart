import 'package:apioment/kaizenControls/Medcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedTextStyles {
  static TextStyle headerFontStyle() {
    return GoogleFonts.sourceSansPro(fontSize: 30, fontWeight: FontWeight.w600);
  }

  static TextStyle cardInnerFontStyle() {
    return GoogleFonts.sourceSansPro(fontSize: 13);
  }

  static TextStyle dropDownFontStyle() {
    return GoogleFonts.sourceSansPro(fontSize: 14);
  }

  static TextStyle cardTitleTextStyle() {
    return GoogleFonts.sourceSansPro(
        fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white);
  }

  static TextStyle cardDetailsTextStyle() {
    return GoogleFonts.sourceSansPro(fontSize: 14);
  }

  static TextStyle buttonContentStyle(fntcolor) {
    return GoogleFonts.poppins(
        fontSize: 20, color: fntcolor, fontWeight: FontWeight.w400);
  }

  static TextStyle pageSubheadingBoldFontStyle(fntcolor) {
    return GoogleFonts.sourceSansPro(
        fontSize: 14, fontWeight: FontWeight.w700, color: fntcolor);
  }

  static TextStyle pageSubheadingFontStyle(fntcolor) {
    return GoogleFonts.sourceSansPro(
        fontSize: 14, fontWeight: FontWeight.w400, color: fntcolor);
  }

  static TextStyle LargeFontStyle(fntcolor) {
    return GoogleFonts.sourceSansPro(
        fontSize: 24, fontWeight: FontWeight.w400, color: fntcolor);
  }

  static TextStyle sourceSansPro() {
    return GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400);
  }

  static TextStyle pageHeaderStyle() {
    return GoogleFonts.sourceSansPro(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white);
  }

  static TextStyle normalDescriptionStyle() {
    return GoogleFonts.sourceSansPro(
        fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black);
  }

  static TextStyle buttonTextStyle() {
    return GoogleFonts.poppins(
        fontSize: 16, color: Medicolor.color1, fontWeight: FontWeight.w400);
  }
}
