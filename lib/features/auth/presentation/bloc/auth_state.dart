part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSuccessState extends AuthState {
  final String uid;
  AuthSuccessState({required this.uid});
}

final class AuthFailureState extends AuthState {
  final String message;
  AuthFailureState({required this.message});
}
