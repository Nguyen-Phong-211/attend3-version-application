import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app.dart';
import 'package:application/config/injection.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('vi_VN', null);
  // Initialize injection
  initAppInjection();

  runApp(
    MultiProvider(
      providers: [
        // Auth Provider
        // ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        BlocProvider<AuthBloc>(
          create: (_) => GetIt.instance<AuthBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}