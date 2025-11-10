// import 'package:application/features/setting/domain/entities/login_history_entity.dart';
// import 'package:application/features/setting/data/login_history_repository.dart';
// import 'package:application/features/setting/data_sources/login_history_remote_data_source.dart';
//
// class LoginHistoryRepositoryImpl implements LoginHistoryRepository {
//   final LoginHistoryRemoteDataSource remoteDataSource;
//
//   LoginHistoryRepositoryImpl({required this.remoteDataSource});
//
//   @override
//   Future<List<LoginHistoryEntity>> getLoginHistory() async {
//     final data = await remoteDataSource.getLoginHistory();
//     return data;
//   }
// }
import 'package:application/features/setting/domain/entities/login_history_entity.dart';
import 'package:application/features/setting/domain/repositories/login_history_repository.dart';
import 'package:application/features/setting/data_sources/login_history_remote_data_source.dart';

class LoginHistoryRepositoryImpl implements LoginHistoryRepository {
  final LoginHistoryRemoteDataSource remoteDataSource;

  LoginHistoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<LoginHistoryEntity>> getLoginHistory() async {
    return await remoteDataSource.getLoginHistory();
  }
}