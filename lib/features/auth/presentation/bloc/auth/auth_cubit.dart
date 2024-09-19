import 'package:bloc/bloc.dart';
import 'package:erickshawapp/features/auth/domain/entities/auth_user.dart';
import 'package:erickshawapp/features/auth/domain/usecase/sign_in_with_google.usecase.dart';
import 'package:erickshawapp/features/auth/presentation/bloc/sign_in/sign_in_state.dart';
import 'package:erickshawapp/shared/toast_alert.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/usecase/sign_in.usecase.dart';
import '../../../domain/usecase/sign_out.usecase.dart';
import '../../../domain/usecase/sign_up.usecase.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase _signInUseCase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SignOutUseCase _signOutUseCase;
  final SignUpUseCase _signUpUseCase;

  AuthCubit({
    required SignInUseCase signInUseCase,
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
    required SignOutUseCase signOutUseCase,
    required SignUpUseCase signUpUseCase,
  })  : _signInUseCase = signInUseCase,
        _signInWithGoogleUseCase = signInWithGoogleUseCase,
        _signOutUseCase = signOutUseCase,
        _signUpUseCase = signUpUseCase,
        super(const AuthState());

  late final AuthUser authUser;

  Future<void> signIn(String email, String password, Function onSuccess) async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = await _signInUseCase(
        SignInParams(email: email, password: password),
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      showSnackbar('Login Successfully', Colors.green);
      onSuccess();
      emit(state.copyWith(isLoading: false, authUser: user));
    } catch (err) {
      showSnackbar(err.toString(), Colors.red);
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> signInWithGoogle(Function onSuccess) async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = await _signInWithGoogleUseCase.call();
      onSuccess();
      emit(state.copyWith(authUser: user, isLoading: false));
    } catch (err) {
      showSnackbar(err.toString(), Colors.red);
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> signUp(String email, String password, Function onSuccess) async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = await _signUpUseCase(
        SignUpParams(email: email, password: password),
      );
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setBool('isLoggedIn', true);
      authUser = AuthUser(
          id: user.id,
          email: user.email,
          phone: user.phone,
          name: user.name,
          photoURL: user.photoURL);
      showSnackbar('SignUp Successfully', Colors.green);
      emit(state.copyWith(isLoading: false, authUser: user));
      onSuccess();
    } catch (err) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> signOut(Function onSuccess) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _signOutUseCase.call();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('isLoggedIn');
      showSnackbar('Log Out Successfully', Colors.green);
      emit(state.copyWith(isLoading: false));
      onSuccess();
    } catch (e) {
      showSnackbar(e.toString(), Colors.red);
      emit(state.copyWith(isLoading: false));
    }
  }
}
