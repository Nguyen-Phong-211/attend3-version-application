import 'package:application/features/setting/domain/entities/login_history_entity.dart';

class LoginHistoryModel extends LoginHistoryEntity {
  LoginHistoryModel({
    required super.deviceName,
    required super.deviceType,
    required super.ipAddress,
    required super.location,
    required super.loginTime,
    required super.logoutTime,
  });

  factory LoginHistoryModel.fromJson(Map<String, dynamic> json) {
    return LoginHistoryModel(
      deviceName: json['device_name'] ?? '',
      deviceType: json['device_type'] ?? '',
      ipAddress: json['ip_address'] ?? '',
      location: json['location'] ?? '',
      loginTime: DateTime.parse(json['login_time']),
      logoutTime: DateTime.parse(json['logout_time']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'device_name': deviceName,
      'device_type': deviceType,
      'ip_address': ipAddress,
      'location': location,
      'login_time': loginTime.toIso8601String(),
      'logout_time': logoutTime.toIso8601String(),
    };
  }
}