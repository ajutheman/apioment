import 'package:apioment/kaizenControls/Medcolors.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

Widget qrScanHelper(BuildContext context, GlobalKey qrKey, qrViewCreated) {
  var scanArea = (MediaQuery.of(context).size.width * 70 / 100);
  return QRView(
    key: qrKey,
    onQRViewCreated: qrViewCreated,
    overlay: QrScannerOverlayShape(
      borderColor: Medicolor.errorMessage,
      borderRadius: 10,
      borderLength: 30,
      borderWidth: 1,
      cutOutSize: scanArea,
    ),
    onPermissionSet: (ctrl, p) => QrHelper.onPermissionSet(context, ctrl, p),
  );
}

class QrHelper {
  static void onPermissionSet(
      BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No Permission')),
      );
    }
  }
}
