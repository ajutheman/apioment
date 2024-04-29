import 'package:apioment/Api/apiClient.dart';
import 'package:apioment/applicationConfig.dart';
import 'package:apioment/models/doctorModel.dart';

Future<List<DoctorModel>> fetchDoctorList() async {
  try {
    ApiClient _client = ApiClient();
    Map<String, dynamic> parameters = {'clinicid': ApplicationConfig.ClinicId};
    final response = await _client.get("api/PatientSchedule/GetDoctor",
        queryParameters: parameters);

    if (response.isSuccess) {
      List<DoctorModel> resp = [];
      for (var item in response.result) {
        resp.add(DoctorModel.fromJson(
            item)); // Assuming the response is a list of JSON objects
        print(resp);
      }

      return resp;
    } else {
      // Handle the case when the response is not successful
      throw Exception('Failed to fetch doctor list');
    }
  } catch (e) {
    // Handle any exceptions that occur during the API call
    print(ApplicationConfig.ClinicId);
    throw Exception(e.toString());
  }
}
