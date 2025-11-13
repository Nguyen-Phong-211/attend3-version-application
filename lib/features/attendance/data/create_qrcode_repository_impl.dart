// Repository implementation, talks to data source
import 'package:application/features/attendance/data_sources/create_qrcode_remote_data_source.dart';
import 'create_qrcode_repository.dart';

class CreateQrCodeRepositoryImpl implements CreateQrCodeRepository {
  final AttendanceRemoteDataSource remoteDataSource;

  CreateQrCodeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Map<String, List<String>>> getClassAndSubject() async {
    return await remoteDataSource.fetchClassAndSubject();
  }
}