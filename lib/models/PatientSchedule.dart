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
    required id,
    required clinicId,
  });

  factory PatientSchedule.fromJson(Map<String, dynamic> json) {
    return PatientSchedule(
      date: json['date'],
      patientMRNumber: json['patientMRNumber'],
      patientName: json['patientName'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      consultedDoctorName: json['consultedDoctorName'],
      treatmentName: json['treatmentName'],
      type: json['type'],
      blockReason: json['blockReason'],
      id: null,
      clinicId: null,
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
