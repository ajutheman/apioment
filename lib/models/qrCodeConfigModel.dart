import 'dart:convert';

class QrCodeConfigModel {
  final String url;
  final int clinicId;

  QrCodeConfigModel({
    required this.url,
    required this.clinicId,
  });

  factory QrCodeConfigModel.fromJson(String jsonData) {
    Map<String, dynamic> jsonMap = json.decode(jsonData);
    return QrCodeConfigModel(
      url: jsonMap['Url'],
      clinicId: jsonMap['ClinicId'],
    );
  }
}

