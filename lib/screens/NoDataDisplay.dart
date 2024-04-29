import 'package:apioment/kaizenControls/Medcolors.dart';
import 'package:apioment/kaizenControls/MedicoControls.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoDataDisplay extends StatelessWidget {
  final String errorMessage;

  NoDataDisplay({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/image/Animation - 1708511109868.json',
          width: 150,
          height: 150,
        ),
        SizedBox(height: 20),
        MedicoControls.NormalText('No data to display'),
        SizedBox(height: 10),
        Text(
          errorMessage,
          style: const TextStyle(color: Medicolor.errorMessage),
        ),
      ],
    );
  }
}
