// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market/models/user_model.dart';
import 'package:market/service/auth_service/auth_service.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late UserModel data;
  final AuthService service;
  String? username,password;
  AuthBloc(this.service) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      emit(AuthUnknown());
     if(event is AuthUser){
       try {
        data = await service.authUser(event.userName,event.password);
        emit(AuthSuccess());
      } catch (e) {
        if(e.toString().contains('400')){
          emit(AuthFailed('Kullanıcı adı veya şifre hatalı'));
        }
      }   
     }
    });
  }
}
