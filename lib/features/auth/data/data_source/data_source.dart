import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthDataSource {
  Future<String> signUpWithEmailPassword(String email, String password);

  Future<String> signInWithEmailPassword(String email, String password);
}

class AuthDataSourceImpl implements AuthDataSource {

  final FirebaseAuth firebaseAuthInst;
  AuthDataSourceImpl(this.firebaseAuthInst);

  @override
  Future<String> signInWithEmailPassword(String email, String password) async {
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword(String email, String password) async {
    try {
      final userCredential = await firebaseAuthInst
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        return userCredential.user!.uid;
      } else {
        return 'Ops! Something went wrong, User not created';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message.toString();
      }
    } catch (e) {
      return 'Something went wrong';
    }
  }
}
