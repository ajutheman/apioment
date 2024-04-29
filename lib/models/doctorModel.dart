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
