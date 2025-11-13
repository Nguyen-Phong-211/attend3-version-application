import 'package:flutter/material.dart';
import 'package:application/features/attendance/presentation/bloc/create_qrcode_bloc.dart';
import 'package:application/features/attendance/data_sources/create_qrcode_remote_data_source.dart';
import 'package:application/features/attendance/domain/use_cases/generate_qr_code_use_case.dart';

class CreateQrCodeProvider extends ChangeNotifier {
  late final CreateQrCodeBloc bloc;

  CreateQrCodeProvider() {
    final useCase = CreateQrCodeUseCase(remoteDataSource: AttendanceRemoteDataSource());
    bloc = CreateQrCodeBloc(customUseCase: useCase);
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}