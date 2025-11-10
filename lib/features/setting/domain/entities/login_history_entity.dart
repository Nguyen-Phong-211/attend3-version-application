class LoginHistoryEntity {
  final String deviceName;
  final String deviceType;
  final String ipAddress;
  final String location;
  final DateTime loginTime;
  final DateTime logoutTime;

  LoginHistoryEntity({
    required this.deviceName,
    required this.deviceType,
    required this.ipAddress,
    required this.location,
    required this.loginTime,
    required this.logoutTime,
  });
}