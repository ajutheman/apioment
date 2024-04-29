// ignore: depend_on_referenced_packages
// ignore_for_file: invalid_use_of_visible_for_testing_member

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
    List<DoctorModel> doctorsInBloc = [];
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
        ReadConfiguration().then((result) {
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
              result = refreshSheduler(doctorsInBloc, selectedDate,
                  ApplicationConfig.DefaultDoctor, schedulesnIBloc, result);
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

        on<LoginButtonPressed>((event, emit) {
          emit(LoginRequestingState());
          String clinicId = ApplicationConfig.ClinicId;
          String username = event.userName;
          String password = event.password;

          var loginRsult = verifyLogin(
            int.parse(clinicId),
            username,
            password,
          );

          ResultData result = ResultData.waiting;
          loginRsult.then((loginResponse) {
            if (loginResponse.resultType == 0) {
              loginResp = loginResponse;
              selectedDate = DateTime.now();
              doctorID = loginResp.userEmpDocNo;
              saveToLocal("defaultDoctor", doctorID);
              result = refreshSheduler(doctorsInBloc, selectedDate, doctorID,
                  schedulesnIBloc, result);
              if (result == ResultData.Success) {
                emit(ShedulerViewState(
                    doctorsInBloc, schedulesnIBloc, selectedDate, doctorID));
              }
            } else {
              result = ResultData.Errors;
            }
          });

          //emit(QRCodeState());
        });

        on<SearchScheduleEvent>((event, emit) async {
          {
            ResultData result = ResultData.waiting;
            result = refreshSheduler(doctorsInBloc, event.searchDate,
                event.employeeDocNo, schedulesnIBloc, result);
            if (result == ResultData.Success) {
              emit(ShedulerViewState(doctorsInBloc, schedulesnIBloc,
                  event.searchDate, event.employeeDocNo));
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

  List<PatientSchedule> get schedulesnIBloc => [];

  ResultData refreshSheduler(
      List<DoctorModel> doctorsInBloc,
      DateTime selectedDate,
      String doctorID,
      List<PatientSchedule> schedulesInBloc,
      ResultData result) {
    var doctor = fetchDoctorList();
    doctor.then((futureDoctors) {
      if (futureDoctors.isNotEmpty) {
        doctorsInBloc = futureDoctors;
        var shedules = fetchSchedules(selectedDate, doctorID);
        shedules.then((futureSchedules) {
          if (futureSchedules.isNotEmpty) {
            schedulesInBloc = futureSchedules;
            result = ResultData.Success;
          } else {
            result = ResultData.NoSchedules;
          }
        });
      } else {
        result = ResultData.NoDoctors;
      }
    });
    return result;
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
