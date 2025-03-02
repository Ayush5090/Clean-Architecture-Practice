import 'package:blog_app/features/auth/data/data_source/data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  serviceLocator.registerLazySingleton(
    () => firebaseAuth,
  );
}

void _initAuth() {
  serviceLocator.registerFactory(() => AuthDataSourceImpl(serviceLocator()));
}
