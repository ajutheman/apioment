class PatientSchedule {
  final DateTime date;
  final String patientMRNumber;
  final String patientName;
  final DateTime startTime;
  final DateTime endTime;
  final String consultedDoctorName;
  final String treatmentName;
  final String type;
  final String? blockReason;
  final int? id;
  final int? clinicId;

  PatientSchedule({
    required this.date,
    required this.patientMRNumber,
    required this.patientName,
    required this.startTime,
    required this.endTime,
    required this.consultedDoctorName,
    required this.treatmentName,
    required this.type,
    this.blockReason,
    this.id,
    this.clinicId,
  });

  factory PatientSchedule.fromJson(Map<String, dynamic> json) {
    return PatientSchedule(
      date: DateTime.parse(json['appDate'] ?? ''),
      patientMRNumber: json['patientDocNo'] ?? '',
      patientName: json['patientName'] ?? '',
      startTime: DateTime.parse(json['startTime'] ?? ''),
      endTime: DateTime.parse(json['endTime'] ?? ''),
      consultedDoctorName: json['consultedDoctorName'] ?? '',
      treatmentName: json['treatmentName'] ?? '',
      type: json['apptype'] ?? '',
      blockReason: json['blockReason'],
      id: json['id'],
      clinicId: json['clinicId'],
    );
  }
}

class ResponseData {
  final List<PatientSchedule> result;
  final int resultType;
  final String message;

  ResponseData({
    required this.result,
    required this.resultType,
    required this.message,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      result: List<PatientSchedule>.from(json['result'].map((x) => PatientSchedule.fromJson(x))),
      resultType: json['resultType'],
      message: json['message'],
    );
  }
}
