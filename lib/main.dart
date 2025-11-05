import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app.dart';
import 'package:application/config/injection.dart';
import 'package:application/config/providers.dart';
import 'package:application/config/blocs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('vi_VN', null);
  // Initialize injection
  initAppInjection();

  runApp(AppBlocs(
    child: AppProviders(
      child: const MyApp(),
    ),
  ));
}