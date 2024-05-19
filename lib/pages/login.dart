// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/bloc/auth_bloc/auth_bloc.dart';
import 'package:market/components/constants/app_strings.dart';
import 'package:market/components/mixin/login_view_mixin.dart';
import 'package:market/components/widgets/login_form_field.dart';
import 'package:market/components/widgets/snack_bar.dart';

class LoginPage extends StatefulWidget {
  // ignore: avoid_types_as_parameter_names
  const LoginPage({super.key, Key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.loginSubTitle,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(letterSpacing: 3),
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 15,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      onChanged: onFormChanged,
                      key: customFormKey,
                      child: Column(
                        children: [
                          LoginTextFormField(
                            validator: (value) => emptyCheck(value.toString()), 
                            controller: userNameController, 
                            hintText: AppStrings.userNameFormHintText, 
                            icon: Icons.person
                            ),
                          const SizedBox(height: 20),
                          LoginTextFormField(
                            validator: (value) => emptyCheck(value.toString()),
                            controller: passwordController, 
                            hintText: AppStrings.passwordFormHintText, 
                            icon: Icons.lock
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder<bool>(
                  valueListenable: formValidateNotifier,
                  builder: (context,value,child) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: !value ? null  : () {
                          callToLoginService();
                        },
                        child: const Text('Giriş'),
                      ),
                    );
                  }
                ),
        BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            CustomSnackBar.showSnackBar(context, state.error);
          }
          if (state is AuthSuccess) {
            //CustomSnackBar.showSnackBar(context, 'Hoşgeldiniz.');
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/Home',
              (Route<dynamic> route) => false,
              arguments: context
            );
          }
        },
        child: const SizedBox(),
              ),
              ],
            ),
          ),
        ),
      ),
      
    );
  }


  
}


