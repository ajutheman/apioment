import 'package:flutter/material.dart';

class Medicolor {
  static const color1 = Colors.white;
  static const color2 = Colors.green;
  static const color3 = Colors.blue;
  static const color4 = Colors.black;
  static const color5 = Colors.green;
  static const color6 = Colors.grey;
  static const colortransparent = Colors.transparent;
  static const errorMessage = Colors.red;
  static const textcolorWhite = Colors.white;
  static const Chipshadowcolors = Colors.black;
  static const ChipbackgroundColor = Colors.white;
  static const BorderSideColorPrimary = Color(0xff000000);
  // shadowColor: Colors.black,
  // backgroundColor: Colors.white,
  static const buildChipcolorgreen = Colors.green;
  static const buildChipcolorblue = Colors.blue;
  static const buildChipcolorred = Colors.red;
  static const containerFillGrandientTopColor = Color(0xFF62C55E);
  static const containerFillGradientBottomColor = Color(0xFF6DA52D);

  static const fontColorPrimary = Color(0xff000000);

  static const fontBackgroundColor = Colors.white;
  static const containerBackgroundColor = Colors.white;

  static const controlBackColor = Color(0xffD9D9D9);

  static const cancelButtonColor = Color(0xffB41616);
  static const proceedButtonColor = Color(0xff00963C);
  static const outlineButtonColor = Color(0xff0095d9);
  static const borderGreyColor = Color(0xffD7D7D7);
  static const secondaryButtonColor = Color(0xffE3782E);
  static const warningMessageBackColor = Color(0xffC59600);
  static const warningMessageBoxBackgroundColor = Color(0xff2d9acc);
  static const panbluecolor = Color(0xff4E5EEE);
  static const onButtonFontColor = Colors.white;

  static const gradientFill = LinearGradient(
    colors: [
      Color(0xFF62C55E),
      Color(0xFF62C55E),
      Color(0xFF6DA52D),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.bottomCenter,
  );
}

GradientPair getGradientColor(String caseType) {
  switch (caseType) {
    case 'Free':
      return GradientPair(
        const LinearGradient(
          colors: [
            Colors.green,
            Colors.lightGreen,
            Colors.green,
            Colors.lightGreen,
          ],
        ),
        const LinearGradient(
          colors: [Colors.green, Colors.lightGreen],
        ),
      );
    case 'Appointment':
      return GradientPair(
        const LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlue,
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
        const LinearGradient(
          colors: [Colors.blue, Colors.lightBlue],
        ),
      );
    case 'Block':
      return GradientPair(
        LinearGradient(
          colors: [Colors.red, Colors.red.shade300],
        ),
        LinearGradient(
          colors: [Colors.red, Colors.red.shade300],
        ),
      );
    default:
      return GradientPair(
        const LinearGradient(
          colors: [Color(0xFFFD0000), Colors.red],
        ),
        LinearGradient(
          colors: [Colors.red, Colors.red.shade500, Colors.redAccent],
        ),
      );
  }
}

class GradientPair {
  final LinearGradient headerGradient;
  final LinearGradient bottomGradient;

  const GradientPair(this.headerGradient, this.bottomGradient);
}

class MedGradients {
  static const containerFillGrandient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment(0, 1),
      colors: <Color>[
        Medicolor.containerFillGrandientTopColor,
        Medicolor.containerFillGradientBottomColor
      ]);
}

class HextoColorConverter {
  static Color colorConvert(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
