import 'package:apioment/Api/apiClient.dart';
import 'package:apioment/applicationConfig.dart';
import 'package:apioment/models/PatientSchedule.dart';

Future<List<PatientSchedule>> fetchSchedules(
    DateTime date, String empDocNo) async {
  try {
    // Check if the date parameter is not null
    // if (date == null) {
    //   throw Exception('Date parameter cannot be null');
    // }

    ApiClient _client = ApiClient();
    Map<String, dynamic> parameters = {
      'ClinicId': ApplicationConfig.ClinicId,
      'date': date.toString(),
      'EmpDocNo': empDocNo
    };
    final response = await _client.get(
      "/api/PatientSchedule/GetPatientSchedule",
      queryParameters: parameters,
    );

    if (response.isSuccess) {
      dynamic responseData = response.result;
      if (responseData != null && responseData['result'] != null) {
        // Extract the list of schedules from the response
        var result = responseData['result'];
        if (result is List) {
          List<PatientSchedule> schedules = [];
          for (var data in result) {
            PatientSchedule schedule = PatientSchedule(
              id: data['id'],
              clinicId: data['clinicId'],
              date: DateTime.parse(data['appDate']),
              patientMRNumber: data['patientDocNo'],
              patientName: data['patientName'],
              startTime: DateTime.parse(data['startTime']),
              endTime: DateTime.parse(data['endTime']),
              consultedDoctorName: data['consultedDoctorName'],
              treatmentName: data['treatmentName'],
              type: data['apptype'],
              blockReason: data['blockReason'],
            );
            schedules.add(schedule);
          }
          return schedules;
        } else {
          // Handle case when the response does not contain the expected data
          throw Exception('Invalid response format: ${response.result}');
        }
      } else {
        // Handle case when the response does not contain the expected data
        throw Exception('Invalid response format: ${response.result}');
      }
    } else {
      // Handle case when the response is not successful
      throw Exception('Failed to fetch schedules: ${response.isSuccess}');
    }
  } catch (e) {
    // Handle any exceptions that occur during the API call
    throw Exception('Failed to fetch schedules: $e');
  }
}
