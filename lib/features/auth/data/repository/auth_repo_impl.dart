import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/features/auth/data/data_source/data_source.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource dataSource;
  AuthRepoImpl(this.dataSource);

  @override
  Future<Either<Failure, String>> signInWithEmailPassword(
      String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword(
      String email, String password) async {
    try {
      final String userId =
          await dataSource.signUpWithEmailPassword(email, password);
      return right(userId);
    } on FirebaseAuthException catch (e) {
      return left(Failure(message: e.message ?? 'Something went wrong'));
    } catch (e) {
      return left(Failure(message: 'Something went wrong'));
    }
  }
}
