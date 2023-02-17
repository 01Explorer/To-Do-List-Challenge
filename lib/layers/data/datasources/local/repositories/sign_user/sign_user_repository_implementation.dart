import 'package:to_do_list_challenge/layers/domain/repositories/sign_user/sign_user_repository.dart';
import 'package:to_do_list_challenge/layers/domain/services/save_local.dart';

class SignUserRepositoryImplementationo implements SignUserRepository {
  final SaveLocal saveLocal;

  SignUserRepositoryImplementationo(this.saveLocal);
  @override
  Future<void> call(String name) async {
    await saveLocal.setString('userName', name);
  }

  @override
  String? getUser() {
    return saveLocal.getString('userName');
  }
}
