import 'package:apioment/Api/apiClient.dart';
import 'package:apioment/applicationConfig.dart';
import 'package:apioment/models/PatientSchedule.dart';

Future<List<PatientSchedule>> fetchSchedules(
    DateTime date, String EmpDocNo) async {
  try {
    ApiClient _client = ApiClient();
    Map<String, dynamic> parameters = {
      'ClinicId': ApplicationConfig.ClinicId,
      'date': date.toString(),
      'EmpDocNo': EmpDocNo
    };
    final response = await _client.get("/api/PatientSchedule/GetPatientSchedule",
        queryParameters: parameters);

    if (response.isSuccess) {
      List<PatientSchedule> resp = [];
      for (var item in response.result) {
        resp.add(PatientSchedule.fromJson(
            item)); // Assuming the response is a list of JSON objects
      }
      return resp;
    } else {
      // Handle the case when the response is not successful
      throw Exception('No Shedules available');
    }
  } catch (e) {
    // Handle any exceptions that occur during the API call
    throw Exception(e.toString());
  }
}
