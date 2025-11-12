import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app.dart';
import 'package:application/config/injection.dart';
import 'package:application/config/providers.dart';
import 'package:application/config/blocs.dart';

// Firebase & Notification
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:application/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('vi_VN', null);

  // Initialize injection
  initAppInjection();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Notification Service
  await NotificationService.init();

  runApp(AppBlocs(
    child: AppProviders(
      child: const MyApp(),
    ),
  ));
}