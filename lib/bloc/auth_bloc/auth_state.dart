part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {}

final class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

final class AuthSuccess extends AuthState{
  @override
  List<Object?> get props => [];
}

final class AuthFailed extends AuthState{
  final String error;
  AuthFailed(this.error);
  
  @override
  List<Object?> get props => [error];
}

final class AuthUnknown extends AuthState{
  @override
  List<Object?> get props => [];
}

