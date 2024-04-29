import 'package:apioment/kaizenControls/MedicoControls.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              'assets/image/internet-connection.json',
              width: 500,
              height: 400,
            ),
            MedicoControls.
                // MedControls
                extraLargelabel('Oops!'),
            const SizedBox(height: 5),
            // MedicoControls.NormalText('No Internet Connection'),
            const SizedBox(height: 5),
            MedicoControls.NormalText('Please check your network settings'),
            const SizedBox(height: 20),
            MedicoControls.kaizenRetryButton("Retry", () async {
              await Navigator.popAndPushNamed(context, '/');
            }),
          ],
        ),
      ),
    );
  }
}
