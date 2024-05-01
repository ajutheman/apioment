abstract class ApplicationEvent {}

class QRCodeScannedEvent extends ApplicationEvent {
  final String qRCodeJson;
  QRCodeScannedEvent(this.qRCodeJson);
}

class RequestQRScanEvent extends ApplicationEvent {}

class SearchEvent extends ApplicationEvent {}

class LoginButtonPressed extends ApplicationEvent {
  final String ClinicId;
  final String userName;
  final String password;

  LoginButtonPressed(
    this.ClinicId,
    this.userName,
    this.password,
  );
}

class LogoutEvent extends ApplicationEvent {}

class SearchScheduleEvent extends ApplicationEvent {
  final DateTime searchDate;
  final String employeeDocNo;
  SearchScheduleEvent(this.searchDate, this.employeeDocNo);
}
