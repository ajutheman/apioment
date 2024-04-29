import 'package:apioment/kaizenControls/MedTextStyles.dart';
import 'package:apioment/kaizenControls/Medcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedButtonStyles {
  static ButtonStyle okButtonStyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: const Color(0xff00963c),
      foregroundColor: const Color(0xffffffff),
      disabledBackgroundColor: Medicolor.proceedButtonColor,
      textStyle: GoogleFonts.sourceSansPro(
          textStyle: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      )));

  static ButtonStyle proceedButtonStyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: const Color(0xff00963c),
      foregroundColor: const Color(0xffffffff),
      disabledBackgroundColor: Medicolor.proceedButtonColor,
      textStyle: GoogleFonts.sourceSansPro(
          textStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      )));

  static ButtonStyle goButtonStyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: const Color(0xff00963c),
      foregroundColor: const Color(0xffffffff),
      disabledBackgroundColor: Medicolor.proceedButtonColor,
      textStyle: GoogleFonts.sourceSansPro(
          textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      )));

  static ButtonStyle retryButtonStyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      minimumSize: const Size(100, 30),
      backgroundColor: Medicolor.cancelButtonColor,
      foregroundColor: Medicolor.onButtonFontColor,
      disabledBackgroundColor: Medicolor.cancelButtonColor,
      disabledForegroundColor: Medicolor.onButtonFontColor,
      textStyle: MedTextStyles.buttonTextStyle());

  static ButtonStyle submiteStyle2 = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      minimumSize: const Size(123, 32),
      backgroundColor: const Color(0xff00963c),
      foregroundColor: Medicolor.onButtonFontColor,
      disabledBackgroundColor: const Color(0xff00963c),
      disabledForegroundColor: Medicolor.onButtonFontColor,
      textStyle: GoogleFonts.sourceSansPro(
          textStyle: const TextStyle(
        fontSize: 15,
        color: Medicolor.onButtonFontColor,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      )));

  static ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      side: const BorderSide(
          color: Medicolor.containerFillGrandientTopColor, width: 2.5),
      shape: (RoundedRectangleBorder(borderRadius: BorderRadius.circular(60))));
}
