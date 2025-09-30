import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app.dart';
import 'package:application/features/auth/presentation/providers/auth_provider.dart';
import 'package:application/config/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('vi_VN', null);

  // Initialize injection
  initAppInjection();

  runApp(
    MultiProvider(
      providers: [
        // Auth Provider
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}