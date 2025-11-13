// Abstract repository definition (domain layer will depend on this)
abstract class CreateQrCodeRepository {
  Future<Map<String, List<String>>> getClassAndSubject();
}