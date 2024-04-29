import 'package:apioment/models/PatientSchedule.dart';
import 'package:apioment/models/doctorModel.dart';

abstract class ApplicationState {}

class ApplicationInitialState extends ApplicationState {}

class QRCodeState extends ApplicationState {}

class QRCodeErrorState extends ApplicationState {}

class LoginPageState extends ApplicationState {}

class LoggedInState extends ApplicationState {}

class LoginRequestingState extends ApplicationState {}

class LoginErrorState extends ApplicationState {
  final String errorMessage;
  LoginErrorState(this.errorMessage);
}

class NoInternetState extends ApplicationState {}

class ShedulerViewState extends ApplicationState {
  final List<DoctorModel> doctors;
  final List<PatientSchedule> Shedules;
  final DateTime SelectedDate;
  final String EmpDocNo;
  ShedulerViewState(
      this.doctors, this.Shedules, this.SelectedDate, this.EmpDocNo);
}

class MedicoPlusErrorState extends ApplicationState {
  final String title;
  final String errorMessage;

  MedicoPlusErrorState(this.title, this.errorMessage);
}
