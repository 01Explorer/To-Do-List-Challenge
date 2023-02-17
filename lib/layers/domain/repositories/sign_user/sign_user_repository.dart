abstract class SignUserRepository {
  Future<void> call(String name);
  String? getUser();
}
