import 'package:bloc/bloc.dart';
import 'package:erickshawapp/features/auth/domain/usecase/sign_in_with_google.usecase.dart';
import 'package:erickshawapp/features/auth/presentation/bloc/sign_in/sign_in_state.dart';
import 'package:erickshawapp/shared/toast_alert.dart';
import 'package:flutter/material.dart';
import '../../../domain/usecase/sign_in.usecase.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase _signInUseCase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;

  SignInCubit({
    required SignInUseCase signInUseCase,
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
  })  : _signInUseCase = signInUseCase,
        _signInWithGoogleUseCase = signInWithGoogleUseCase,
        super(const SignInState());


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


  Future<void> signIn(Function onSuccess) async {
    if (!(state.emailStatus == EmailStatus.valid) ||
        !(state.passwordStatus == PasswordStatus.valid)) {
      showSnackbar('Invalid Form',Colors.red);
      emit(state.copyWith(formStatus: FormStatus.invalid));
      emit(state.copyWith(formStatus: FormStatus.initial));
    }

    emit(state.copyWith(
        formStatus: FormStatus.submissionInProgress, isLoading: true));
    try {
    final user=  await _signInUseCase(
        SignInParams(
          email: state.email!,
          password: state.password!,
        ),
      );
      onSuccess();
      emit(state.copyWith(
          formStatus: FormStatus.submissionSuccess, isLoading: false,authUser: user));
    } catch (err) {
      showSnackbar(err.toString(),Colors.red);
      emit(state.copyWith(
          formStatus: FormStatus.submissionFailure, isLoading: false));
    }
  }

  Future<void> signInWithGoogle(Function onSuccess) async {

    emit(state.copyWith(
        formStatus: FormStatus.submissionInProgress, isLoading: true));
    try {
    final user=  await _signInWithGoogleUseCase.call();
      onSuccess();
      emit(state.copyWith(
          formStatus: FormStatus.submissionSuccess, isLoading: false,authUser: user));
    } catch (err) {
      showSnackbar(err.toString(),Colors.red);
      emit(state.copyWith(
          formStatus: FormStatus.submissionFailure, isLoading: false));
    }
  }
}
