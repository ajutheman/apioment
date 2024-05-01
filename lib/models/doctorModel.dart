// doctor_model.dart
class DoctorModel {
  final String empDocNo;
  final String employeeName;

  DoctorModel({
    required this.empDocNo,
    required this.employeeName,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      empDocNo: json['empDocNo'] as String,
      employeeName: json['employeeName'] as String,
    );
  }
}

class ResponseData {
  final List<DoctorModel> result;
  final int resultType;
  final String message;

  ResponseData({
    required this.result,
    required this.resultType,
    required this.message,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      result: List<DoctorModel>.from(
          json['result'].map((x) => DoctorModel.fromJson(x))),
      resultType: json['resultType'],
      message: json['message'],
    );
  }
}
