import 'package:application/features/home/presentation/providers/home_provider.dart';
import 'home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeProvider provider;

  HomeRepositoryImpl(this.provider);

  @override
  Future<List<String>> getTodaySchedules() => provider.fetchTodaySchedules();

  @override
  Future<String> getUserName() => provider.fetchUserName();
}