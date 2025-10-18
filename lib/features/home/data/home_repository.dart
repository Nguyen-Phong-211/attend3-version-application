abstract class HomeRepository {
  Future<List<String>> getTodaySchedules();
  Future<String> getUserName();
}