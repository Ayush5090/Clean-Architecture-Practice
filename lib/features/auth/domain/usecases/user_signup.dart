import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements Usecase<String, UserSignUpParams> {
  final AuthRepo authRepo;
  UserSignUp(this.authRepo);

  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    return await authRepo.signUpWithEmailPassword(
        params.email, params.password);
  }
}

class UserSignUpParams {
  final String email;
  final String password;

  UserSignUpParams({required this.email, required this.password});
}
