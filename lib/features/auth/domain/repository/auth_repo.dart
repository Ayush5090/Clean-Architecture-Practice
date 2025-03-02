import 'package:blog_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepo {
  Future<Either<Failure, String>> signUpWithEmailPassword(
      String email, String password);

  Future<Either<Failure, String>> signInWithEmailPassword(
      String email, String password);
}
