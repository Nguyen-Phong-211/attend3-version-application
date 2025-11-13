import 'package:application/features/attendance/data_sources/create_qrcode_remote_data_source.dart';
import 'package:application/features/attendance/domain/entities/qr_code_data.dart';

class CreateQrCodeUseCase {
  final AttendanceRemoteDataSource remoteDataSource;

  CreateQrCodeUseCase({required this.remoteDataSource});

  Future<String> call(QrCodeData data) async {
    return await remoteDataSource.createQrCode(data);
  }
}