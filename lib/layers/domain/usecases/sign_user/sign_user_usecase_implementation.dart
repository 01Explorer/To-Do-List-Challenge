import 'package:to_do_list_challenge/layers/domain/usecases/sign_user/sign_user_usecase.dart';
import '../../repositories/sign_user/sign_user_repository.dart';

class SignUserUsecaseImplementation implements SignUserUsecase {
  final SignUserRepository repository;

  SignUserUsecaseImplementation(this.repository);
  @override
  Future<void> call(String name) async {
    await repository(name);
  }

  @override
  String? getUser() {
    return repository.getUser();
  }
}
