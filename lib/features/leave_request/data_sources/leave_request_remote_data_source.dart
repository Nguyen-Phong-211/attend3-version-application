// import 'package:http/http.dart' as http;
// import 'dart:convert';

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