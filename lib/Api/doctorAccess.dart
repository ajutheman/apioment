import 'package:apioment/Api/apiClient.dart';
import 'package:apioment/applicationConfig.dart';
import 'package:apioment/models/doctorModel.dart';

Future<List<DoctorModel>> fetchDoctorList() async {
  try {
    ApiClient _client = ApiClient();
    Map<String, dynamic> parameters = {'p_clinicId': ApplicationConfig.ClinicId};
    final response = await _client.get("/api/PatientSchedule/GetDoctor",
        queryParameters: parameters);
    if(response.isSuccess)
    {
      var result = ResponseData.fromJson(response.result);

      return result.result;
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
