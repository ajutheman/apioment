// // To parse this JSON data, do
// //
// //     final patientSchedule = patientScheduleFromJson(jsonString);
//
// import 'dart:convert';
//
// PatientSchedule patientScheduleFromJson(String str) =>
//     PatientSchedule.fromJson(json.decode(str));
//
// String patientScheduleToJson(PatientSchedule data) =>
//     json.encode(data.toJson());
//
// class PatientSchedule {
//   final List<Result>? result;
//   final int? resultType;
//   final String? message;
//
//   PatientSchedule({
//     this.result,
//     this.resultType,
//     this.message,
//   });
//
//   factory PatientSchedule.fromJson(Map<String, dynamic> json) =>
//       PatientSchedule(
//         result: json["result"] == null
//             ? []
//             : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
//         resultType: json["resultType"],
//         message: json["message"],
//       );
//
//   Map<String, dynamic> toJson() => {
//     "result": result == null
//         ? []
//         : List<dynamic>.from(result!.map((x) => x.toJson())),
//     "resultType": resultType,
//     "message": message,
//   };
// }
//
// class Result {
//   final int? id;
//   final int? clinicId;
//   final DateTime? appDate;
//   final String? appDocNo;
//   final String? appDocType;
//   final String? appDoctDocNo;
//   final String? patientDocNo;
//   final String? patientName;
//   final DateTime? startTime;
//   final DateTime? endTime;
//   final String? consultedDoctorName;
//   final String? treatmentName;
//   final String? apptype;
//   final String? blockReason;
//   final String? remarks;
//   final String? status;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final String? mode;
//
//   Result({
//     this.id,
//     this.clinicId,
//     this.appDate,
//     this.appDocNo,
//     this.appDocType,
//     this.appDoctDocNo,
//     this.patientDocNo,
//     this.patientName,
//     this.startTime,
//     this.endTime,
//     this.consultedDoctorName,
//     this.treatmentName,
//     this.apptype,
//     this.blockReason,
//     this.remarks,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.mode,
//   });
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     id: json["id"],
//     clinicId: json["clinicId"],
//     appDate:
//     json["appDate"] == null ? null : DateTime.parse(json["appDate"]),
//     appDocNo: json["appDocNo"],
//     appDocType: json["appDocType"],
//     appDoctDocNo: json["appDoctDocNo"],
//     patientDocNo: json["patientDocNo"],
//     patientName: json["patientName"],
//     startTime: json["startTime"] == null
//         ? null
//         : DateTime.parse(json["startTime"]),
//     endTime:
//     json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
//     consultedDoctorName: json["consultedDoctorName"],
//     treatmentName: json["treatmentName"],
//     apptype: json["apptype"],
//     blockReason: json["blockReason"],
//     remarks: json["remarks"],
//     status: json["status"],
//     createdAt: json["created_at"] == null
//         ? null
//         : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null
//         ? null
//         : DateTime.parse(json["updated_at"]),
//     mode: json["mode"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "clinicId": clinicId,
//     "appDate": appDate?.toIso8601String(),
//     "appDocNo": appDocNo,
//     "appDocType": appDocType,
//     "appDoctDocNo": appDoctDocNo,
//     "patientDocNo": patientDocNo,
//     "patientName": patientName,
//     "startTime": startTime?.toIso8601String(),
//     "endTime": endTime?.toIso8601String(),
//     "consultedDoctorName": consultedDoctorName,
//     "treatmentName": treatmentName,
//     "apptype": apptype,
//     "blockReason": blockReason,
//     "remarks": remarks,
//     "status": status,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "mode": mode,
//   };
// }

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
