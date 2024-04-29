import 'package:apioment/applicationbloc/ApplicationBloc.dart';
import 'package:apioment/applicationbloc/ApplicationEvents.dart';
import 'package:apioment/kaizenControls/MedTextStyles.dart';
import 'package:apioment/kaizenControls/MedicoControls.dart';
import 'package:apioment/kaizenwidgects/qrscanHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ConnectionPage extends StatelessWidget {
  BuildContext applicationContext;
  ConnectionPage(this.applicationContext, {super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
    return Scaffold(
      body: Column(
        children: <Widget>[
          MedicoControls.VerticalFiller(50),
          Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                'Connect with Medicoplus',
                textAlign: TextAlign.left,
                style: MedTextStyles.pageHeaderStyle(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  'To connect the schedule viewer to your Medicoplus application in the clinic, kindly scan the QR code from the Windows application. The QR code is available in the Appointment Medicoplus Ayur and on the login screen in other versions of Medicoplus',
                  style: MedTextStyles.normalDescriptionStyle(),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4, child: qrScanHelper(context, qrKey, onQrViewCreated)),
        ],
      ),
    );
  }

  void onQrViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) {
      final appSchedulerBloc =
          BlocProvider.of<ApplicationBloc>(applicationContext);
      appSchedulerBloc.add(QRCodeScannedEvent(scanData.code.toString()));
    });
  }
}
