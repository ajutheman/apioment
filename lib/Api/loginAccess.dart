import 'package:apioment/Api/apiClient.dart';
import 'package:apioment/applicationConfig.dart';
import 'package:apioment/models/loginResponse.dart';

Future<LoginResponseModel> verifyLogin(
  String clinicId,
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

    var response = await client.post("api/Users/Login?", data: parameters);
    print("response.isSuccess");
    print(response.isSuccess);
    print(parameters);
    print(password);
    print(ApplicationConfig.ConnectionUrl);
    if (response.isSuccess) {
      print("object");
      print(response.result);
      return LoginResponseModel.fromJson(response.result);
    } else {
      // throw Exception('Failed to fetch doctor list');
      throw Exception(response.result);
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}