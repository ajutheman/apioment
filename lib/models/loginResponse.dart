class LoginResponseModel {
  final int resultType;
  final String message;
  final int id;
  final int clinicId;
  final String username;
  final String userEmpDocNo;
  final bool fullAccess;

  LoginResponseModel({
    required this.resultType,
    required this.message,
    required this.id,
    required this.clinicId,
    required this.username,
    required this.userEmpDocNo,
    required this.fullAccess,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      resultType: json['resultType'] as int,
      message: json['message'] as String,
      id: json['id'] as int,
      clinicId: json['clinicId'] as int,
      username: json['username'] as String,
      userEmpDocNo: json['userEmpDocNo'] as String,
      fullAccess: json['fullAccess'] as bool,
    );
  }
}
