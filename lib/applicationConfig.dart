class ApplicationConfig
{
  static String ConnectionUrl ="";
  static String ClinicId = "";
  static ConfigStatus configStatus=ConfigStatus.notConfigured;
  static String DefaultDoctor=""; 
}

enum ConfigStatus
{
   notConfigured,
   configured,
   loggedIn
}



ConfigStatus toConfigStatus(String value) {
  switch (value) {
    case 'ConfigStatus.notConfigured':
      return ConfigStatus.notConfigured;
    case 'ConfigStatus.configured':
      return ConfigStatus.configured;
    case 'ConfigStatus.loggedIn':
      return ConfigStatus.loggedIn;
    default:
      throw ArgumentError('Invalid config status value: $value');
  }
}