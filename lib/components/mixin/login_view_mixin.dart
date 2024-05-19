import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/bloc/auth_bloc/auth_bloc.dart';
import 'package:market/pages/login.dart';

mixin LoginViewMixin on State<LoginPage>{
  final GlobalKey<FormState> customFormKey = GlobalKey<FormState>();
  final String? value = ""; 
  final ValueNotifier<bool> formValidateNotifier = ValueNotifier<bool>(false);
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  void onFormChanged(){
    formValidateNotifier.value = customFormKey.currentState?.validate() ?? false;
  }

  String? emptyCheck(String value){
    if(value.isEmpty){
      return 'Lütfen boş alan bırakmayınız.';
    }
    return null;
  }

  void callToLoginService(){
    BlocProvider.of<AuthBloc>(context).add(
      AuthUser(
        userNameController.text,
        passwordController.text,
        ),
       );
  }
  

}