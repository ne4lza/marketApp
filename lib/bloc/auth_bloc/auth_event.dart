part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {}

class AuthUser extends AuthEvent{
  final String userName;
  final String password;

  AuthUser(this.userName,this.password);
  
  @override
  List<Object?> get props => [userName,password];
}
