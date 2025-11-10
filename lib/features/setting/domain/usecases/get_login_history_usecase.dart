import 'package:application/features/setting/domain/entities/login_history_entity.dart';
import 'package:application/features/setting/domain/repositories/login_history_repository.dart';

class GetLoginHistoryUseCase {
  final LoginHistoryRepository repository;

  GetLoginHistoryUseCase({required this.repository});

  Future<List<LoginHistoryEntity>> call() async {
    return await repository.getLoginHistory();
  }
}