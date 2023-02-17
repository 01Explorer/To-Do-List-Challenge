import 'package:to_do_list_challenge/layers/domain/usecases/sign_user/sign_user_usecase.dart';

class LandPageController {
  final SignUserUsecase usecase;

  LandPageController(this.usecase);

  String? getUser() {
    return usecase.getUser();
  }

  Future<void> signUser(String name) async {
    await usecase(name);
  }
}
