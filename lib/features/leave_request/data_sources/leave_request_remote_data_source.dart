// import 'package:http/http.dart' as http;
// import 'dart:convert';

import '../domain/entities/approval_leave_request_entity.dart';

class LeaveRequestRemoteDataSource {
  Future<bool> submitLeaveRequest({
    required String subject,
    required String teacher,
    required String semester,
    required String year,
    required DateTime fromDate,
    required DateTime toDate,
    required String reason,
  }) async {
    // TODO: CHANGE HERE WHEN USING API
    // final url = Uri.parse('https://yourapi.com/api/leave-request');
    //
    // final response = await http.post(
    //   url,
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode({
    //     'subject': subject,
    //     'teacher': teacher,
    //     'semester': semester,
    //     'year': year,
    //     'from_date': fromDate.toIso8601String(),
    //     'to_date': toDate.toIso8601String(),
    //     'reason': reason,
    //   }),
    // );
    //
    // if (response.statusCode == 200) {
    //   final data = jsonDecode(response.body);
    //   return data['success'] == true;
    // } else {
    //   throw Exception('Failed to submit leave request');
    // }

    await Future.delayed(const Duration(seconds: 2));
    print('Submit leave request to API...');
    print('Subject: $subject, Teacher: $teacher');
    return true;
  }
}

class ApprovalRemoteDataSource {
  ApprovalRemoteDataSource();

  /// TODO: Replace with real API call
  /// For now returns sample data. When integrating API:
  ///   - Use http/dio to GET /leave-requests
  ///   - Map JSON to ApprovalLeaveRequestEntity

  Future<List<ApprovalLeaveRequestEntity>> fetchRequestsMock() async {
    await Future.delayed(const Duration(milliseconds: 300));
    final data = [
      {
        'id': '1',
        'name': 'Nguyễn Văn A',
        'class': 'CTK43A',
        'subject': 'Lập trình Java',
        'from': DateTime(2025, 10, 18).toIso8601String(),
        'to': DateTime(2025, 10, 19).toIso8601String(),
        'reason': 'Bị ốm, xin nghỉ 2 ngày.',
        'status': 'approved',
      },
      {
        'id': '2',
        'name': 'Trần Thị B',
        'class': 'CTK44B',
        'subject': 'Cơ sở dữ liệu',
        'from': DateTime(2025, 10, 20).toIso8601String(),
        'to': DateTime(2025, 10, 20).toIso8601String(),
        'reason': 'Việc gia đình gấp.',
        'status': 'rejected',
      },
      {
        'id': '3',
        'name': 'Lê Hoàng C',
        'class': 'CTK43B',
        'subject': 'Mạng máy tính',
        'from': DateTime(2025, 10, 22).toIso8601String(),
        'to': DateTime(2025, 10, 23).toIso8601String(),
        'reason': 'Đi thi chứng chỉ.',
        'status': 'approved',
      },
      {
        'id': '4',
        'name': 'Lê Chí D',
        'class': 'CTK43B',
        'subject': 'Mạng máy tính',
        'from': DateTime(2025, 10, 23).toIso8601String(),
        'to': DateTime(2025, 10, 24).toIso8601String(),
        'reason': 'Đi học ngoại ngữ',
        'status': 'pending',
      },
    ];

    return data.map((e) => ApprovalLeaveRequestEntity(
      id: e['id'].toString(),
      name: e['name'] as String,
      studentClass: e['class'] as String,
      subject: e['subject'] as String,
      from: DateTime.parse(e['from'] as String),
      to: DateTime.parse(e['to'] as String),
      reason: e['reason'] as String,
      status: e['status'] as String,
    )).toList();
  }

// TODO: implement actual API calls here when ready.
// Example (commented):
// Future<List<ApprovalLeaveRequestEntity>> fetchRequests() async {
//   final response = await http.get(Uri.parse('https://api/...'));
//   if (response.statusCode == 200) { ... }
// }
}