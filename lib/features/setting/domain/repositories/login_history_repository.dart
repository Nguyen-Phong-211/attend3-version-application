import 'package:application/features/setting/domain/entities/login_history_entity.dart';

abstract class LoginHistoryRepository {
  Future<List<LoginHistoryEntity>> getLoginHistory();
}