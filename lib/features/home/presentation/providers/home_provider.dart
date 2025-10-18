import 'dart:async';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  /// TODO: Replace this mock with real API call
  /// Example: await dio.get('/home/schedules');
  Future<List<String>> fetchTodaySchedules() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      'Software Engineering - Room 302',
      'Database System - Room 208',
      'Flutter Workshop - Online'
    ];
  }

  /// TODO: Replace this mock with real API call
  /// Example: await dio.get('/user/profile');
  Future<String> fetchUserName() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return 'John Doe';
  }
}