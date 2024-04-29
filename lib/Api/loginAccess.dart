import 'package:apioment/Api/apiClient.dart';
import 'package:apioment/applicationConfig.dart';
import 'package:apioment/models/loginResponse.dart';

Future<LoginResponseModel> verifyLogin(
  int clinicId,
  String username,
  String password,
) async {
  try {
    ApiClient client = ApiClient();

    Map<String, dynamic> parameters = {
      'clinicId': clinicId,
      'username': username,
      'password': password,
    };

    var response = await client.post("/api/Users/Login", data: parameters);   
    if (response.isSuccess) {    
      return LoginResponseModel.fromJson(response.result);
    } else
    {
            throw Exception(response.result);
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}
