import 'package:bloc/bloc.dart';
import 'package:erickshawapp/features/auth/presentation/bloc/sign_up/sign_up_state.dart';
import 'package:erickshawapp/shared/toast_alert.dart';
import 'package:flutter/material.dart';

import '../../../domain/usecase/sign_up.usecase.dart';
import '../sign_in/sign_in_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpCubit({
    required SignUpUseCase signUpUseCase,
  })  : _signUpUseCase = signUpUseCase,
        super(const SignUpState());

  void emailChanged(String value) {
    final email = value.toString();

    final emailRegex = RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

    if (emailRegex.hasMatch(email)) {
      emit(
        state.copyWith(
          email: email,
          emailStatus: EmailStatus.valid,
        ),
      );
    } else {
      emit(state.copyWith(emailStatus: EmailStatus.invalid));
    }
  }

  void passwordChanged(String value) {
    final password = value.toString();

    if (password.length >= 6) {
      emit(
        state.copyWith(
          password: password,
          passwordStatus: PasswordStatus.valid,
        ),
      );
    } else {
      emit(state.copyWith(passwordStatus: PasswordStatus.invalid));
    }
  }

  Future<void> signUp(Function onSuccess) async {
    if (!(state.emailStatus == EmailStatus.valid) ||
        !(state.passwordStatus == PasswordStatus.valid)) {
      emit(state.copyWith(formStatus: FormStatus.invalid));
      emit(state.copyWith(formStatus: FormStatus.initial));
      showSnackbar('Invalid Form', Colors.red);
    }

    emit(state.copyWith(
        formStatus: FormStatus.submissionInProgress, isLoading: true));
    try {
      final user = await _signUpUseCase(
        SignUpParams(email: state.email!, password: state.password!),
      );
      onSuccess();
      emit(state.copyWith(
          formStatus: FormStatus.submissionSuccess,
          isLoading: false,
          authUser: user));
    } catch (err) {
      emit(state.copyWith(
          formStatus: FormStatus.submissionFailure, isLoading: false));
    }
  }
}
