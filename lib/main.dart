import 'package:blog_app/config/theme/app_theme.dart';
import 'package:blog_app/features/auth/data/data_source/data_source.dart';
import 'package:blog_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:blog_app/features/auth/domain/usecases/user_signup.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/features/auth/presentation/views/signin.dart';
import 'package:blog_app/features/auth/presentation/views/signup.dart';
import 'package:blog_app/firebase_options.dart';
import 'package:blog_app/init_dependencies.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthBloc(
            userSignUp: UserSignUp(
                AuthRepoImpl(AuthDataSourceImpl(FirebaseAuth.instance)))),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: const SignInScreen(),
    );
  }
}
