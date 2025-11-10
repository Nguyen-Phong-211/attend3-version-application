// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:application/features/setting/data/models/login_history_model.dart';
//
// abstract class LoginHistoryRemoteDataSource {
//   Future<List<LoginHistoryModel>> getLoginHistory();
// }
//
// class LoginHistoryRemoteDataSourceImpl implements LoginHistoryRemoteDataSource {
//   final String baseUrl;
//
//   LoginHistoryRemoteDataSourceImpl({required this.baseUrl});
//
//   @override
//   Future<List<LoginHistoryModel>> getLoginHistory() async {
//     // TODO: Replace with real API URL
//     final response = await http.get(Uri.parse('$baseUrl/login-history'));
//
//     if (response.statusCode == 200) {
//       final List data = jsonDecode(response.body);
//       return data.map((e) => LoginHistoryModel.fromJson(e)).toList();
//     } else {
//       throw Exception('Failed to load login history');
//     }
//   }
// }
import 'dart:async';
import 'package:application/features/setting/domain/entities/login_history_entity.dart';

abstract class LoginHistoryRemoteDataSource {
  Future<List<LoginHistoryEntity>> getLoginHistory();
}

class LoginHistoryRemoteDataSourceImpl implements LoginHistoryRemoteDataSource {
  // TODO: Replace with real API base URL when available
  final String baseUrl;

  LoginHistoryRemoteDataSourceImpl({required this.baseUrl});

  @override
  Future<List<LoginHistoryEntity>> getLoginHistory() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Sample mock data (replace this with real API response later)
    final sampleData = [
      {
        'deviceName': 'iPhone 14 Pro Max',
        'deviceType': 'Mobile',
        'ipAddress': '192.168.1.15',
        'location': 'Hà Nội, Việt Nam',
        'loginTime': DateTime.now().subtract(const Duration(hours: 1)),
        'logoutTime': DateTime.now().subtract(const Duration(minutes: 10)),
      },
      {
        'deviceName': 'MacBook Air M2',
        'deviceType': 'Laptop',
        'ipAddress': '192.168.1.8',
        'location': 'Đà Nẵng, Việt Nam',
        'loginTime': DateTime.now().subtract(const Duration(days: 1, hours: 2)),
        'logoutTime': DateTime.now().subtract(const Duration(days: 1)),
      },
      {
        'deviceName': 'Samsung Galaxy S23',
        'deviceType': 'Mobile',
        'ipAddress': '192.168.1.20',
        'location': 'TP. Hồ Chí Minh, Việt Nam',
        'loginTime': DateTime.now().subtract(const Duration(days: 2, hours: 3)),
        'logoutTime': DateTime.now().subtract(const Duration(days: 2, hours: 1)),
      },
    ];

    // Convert sample data into entity list
    return sampleData.map((e) => LoginHistoryEntity(
      deviceName: e['deviceName'] as String,
      deviceType: e['deviceType'] as String,
      ipAddress: e['ipAddress'] as String,
      location: e['location'] as String,
      loginTime: e['loginTime'] as DateTime,
      logoutTime: e['logoutTime'] as DateTime,
    )).toList();
  }
}