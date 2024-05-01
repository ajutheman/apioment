// ignore: depend_on_referenced_packages
// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:apioment/Api/doctorAccess.dart';
import 'package:apioment/Api/loginAccess.dart';
import 'package:apioment/Api/scheduleAccess.dart';
import 'package:apioment/applicationConfig.dart';
import 'package:apioment/applicationbloc/ApplicationEvents.dart';
import 'package:apioment/applicationbloc/ApplicationState.dart';
import 'package:apioment/models/PatientSchedule.dart';
import 'package:apioment/models/doctorModel.dart';
import 'package:apioment/models/loginResponse.dart';
import 'package:apioment/models/qrCodeConfigModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationInitialState()) {
    List<PatientSchedule> schedulesInBloc = [];
    LoginResponseModel loginResp;

    String doctorID;
    DateTime selectedDate = DateTime.now();

    final connection = InternetConnection();
    connection.onStatusChange.listen((InternetStatus status) {
      // Internet state checking
      if (status == InternetStatus.disconnected) {
        emit(NoInternetState());
      } else {
        //configuration Checking
        ReadConfiguration().then((result) async {
          if (result == false) {
            emit(QRCodeState());
          } else {
            if (ApplicationConfig.configStatus == ConfigStatus.notConfigured) {
              emit(QRCodeState());
            } else if (ApplicationConfig.configStatus ==
                ConfigStatus.configured) {
              emit(LoginPageState());
            } else if (ApplicationConfig.configStatus ==
                ConfigStatus.loggedIn) {
              ResultData result = ResultData.waiting;
              result = await refreshScheduler(
                  // doctorsInBloc,
                  selectedDate,
                  ApplicationConfig.DefaultDoctor,
                  // schedulesnIBloc,
                  result);
              if (result == ResultData.Success) {
                emit(ShedulerViewState(doctorsInBloc, schedulesnIBloc,
                    selectedDate, ApplicationConfig.DefaultDoctor));
              }
            }
          }
        }).catchError((error) {
          emit(MedicoPlusErrorState("Error", error.toString()));
        });

        on<RequestQRScanEvent>((event, emit) {
          emit(QRCodeState());
        });

        on<SearchEvent>((event, emit) {
          // emit(ShedulerViewState(
          //     doctorsInBloc, schedulesnIBloc, selectedDate, doctorID
          //     // doctorID,
          //     ));
        });
        on<LogoutEvent>((event, emit) async {
          // Perform logout actions here, such as clearing user session data
          // For example:
          // await clearUserSessionData();

          // Emit a state indicating that the user is logged out
          emit(LoginPageState());
        });

        on<LoginButtonPressed>((event, emit) async {
          // emit(LoginRequestingState());

          String clinicId = ApplicationConfig.ClinicId;
          String username = event.userName;
          String password = event.password;

          try {
            var loginResult = await verifyLogin(
              int.parse(clinicId),
              username,
              password,
            );

            if (loginResult.resultType == 0) {
              loginResp = loginResult;
              selectedDate = DateTime(2024, 04, 27);
              doctorID = loginResp.userEmpDocNo;
              saveToLocal("defaultDoctor", doctorID);

              ResultData result = ResultData.waiting;
              result = await refreshScheduler(
                // doctorsInBloc,
                selectedDate,
                doctorID,
                // schedulesnIBloc,
                result,
              );

              if (result == ResultData.Success) {
                emit(ShedulerViewState(
                  doctorsInBloc,
                  schedulesnIBloc,
                  selectedDate,
                  doctorID,
                ));
              } else {
                // Handle failure scenarios
              }
            } else {
              emit(LoginErrorState(loginResult.message));
            }
          } catch (e) {
            // Handle exceptions
          }
        });

        on<SearchScheduleEvent>((event, emit) async {
          {
            ResultData result = ResultData.waiting;
            doctorID = event.employeeDocNo;
            selectedDate = event.searchDate;
            result = await refreshScheduler(
              // doctorsInBloc,
              event.searchDate,
              event.employeeDocNo,
              // schedulesnIBloc,
              result,
            );

            if (result == ResultData.Success) {
              emit(ShedulerViewState(
                doctorsInBloc,
                schedulesnIBloc,
                event.searchDate,
                event.employeeDocNo,
              ));
            } else {
              // Handle failure scenarios
            }
          }
        });

        // Controlling Events
        on<QRCodeScannedEvent>((event, emit) async {
          QrCodeConfigModel config = QrCodeConfigModel(url: "", clinicId: -1);
          try {
            config = QrCodeConfigModel.fromJson(event.qRCodeJson.toString());
          } catch (e) {
            emit(MedicoPlusErrorState(
                "Invalid QR Code", "The QR Code Which you scanned is invalid"));
          }
          if (config.clinicId != -1) {
            saveToLocal("ConnectionURL", config.url);
            saveToLocal("ClinicId", config.clinicId.toString());
            saveToLocal("Configuration", ConfigStatus.configured.toString());
            ApplicationConfig.ConnectionUrl = config.url;
            ApplicationConfig.ClinicId = config.clinicId.toString();
            ApplicationConfig.configStatus = ConfigStatus.configured;
            ApplicationConfig.DefaultDoctor = "";
            emit(LoginPageState());
          }
        });
      }
    });
  }

  static List<PatientSchedule> schedulesnIBloc = [];
  static List<DoctorModel> doctorsInBloc = [];

  Future<ResultData> refreshScheduler(
      // List<DoctorModel> doctorsInBloc,
      DateTime selectedDate,
      String doctorID,
      // List<PatientSchedule> schedulesInBloc,
      ResultData result) async {
    try {
      var futureDoctors = await fetchDoctorList();
      if (futureDoctors.isNotEmpty) {
        doctorsInBloc = futureDoctors;
        var futureSchedules = await fetchSchedules(selectedDate, doctorID);
        if (futureSchedules.isNotEmpty) {
          schedulesnIBloc = futureSchedules;
          return ResultData.Success;
        } else {
          return ResultData.NoSchedules;
        }
      } else {
        return ResultData.NoDoctors;
      }
    } catch (e) {
      // Handle any exceptions that might occur during fetching
      throw "erro";
    }
  }

  Future<bool> ReadConfiguration() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApplicationConfig.ConnectionUrl = prefs.get("ConnectionURL").toString();
    ApplicationConfig.ClinicId = prefs.get("ClinicId").toString();
    ApplicationConfig.DefaultDoctor = prefs.get("defaultDoctor").toString();
    ApplicationConfig.configStatus = prefs.get("Configuration") != null
        ? toConfigStatus(prefs.get("Configuration").toString())
        : ConfigStatus.notConfigured;
    return true;
  }

  Future saveToLocal(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
}

enum ResultData { NoDoctors, NoSchedules, Errors, Success, waiting }
