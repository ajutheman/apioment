// class Result {
//     final int? id;
//     final int? clinicId;
//     final DateTime? appDate;
//     final String? appDocNo;
//     final String? appDocType;
//     final String? appDoctDocNo;
//     final String? patientDocNo;
//     final String? patientName;
//     final DateTime? startTime;
//     final DateTime? endTime;
//     final String? consultedDoctorName;
//     final String? treatmentName;
//     final String? apptype;
//     final String? blockReason;
//     final String? remarks;
//     final String? status;
//     final DateTime? createdAt;
//     final dynamic updatedAt;
//     final String? mode;

//     Result({
//         this.id,
//         this.clinicId,
//         this.appDate,
//         this.appDocNo,
//         this.appDocType,
//         this.appDoctDocNo,
//         this.patientDocNo,
//         this.patientName,
//         this.startTime,
//         this.endTime,
//         this.consultedDoctorName,
//         this.treatmentName,
//         this.apptype,
//         this.blockReason,
//         this.remarks,
//         this.status,
//         this.createdAt,
//         this.updatedAt,
//         this.mode,
//     });

//     factory Result.fromJson(Map<String, dynamic> json) => Result(
//         id: json["id"],
//         clinicId: json["clinicId"],
//         appDate: json["appDate"] == null ? null : DateTime.parse(json["appDate"]),
//         appDocNo: json["appDocNo"],
//         appDocType: json["appDocType"],
//         appDoctDocNo: json["appDoctDocNo"],
//         patientDocNo: json["patientDocNo"],
//         patientName: json["patientName"],
//         startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
//         endTime: json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
//         consultedDoctorName: json["consultedDoctorName"],
//         treatmentName: json["treatmentName"],
//         apptype: json["apptype"],
//         blockReason: json["blockReason"],
//         remarks: json["remarks"],
//         status: json["status"],
//         createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"],
//         mode: json["mode"],
//     );
// }