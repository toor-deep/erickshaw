import 'package:bloc/bloc.dart';
import 'package:erickshawapp/features/auth/domain/entities/auth_user.dart';
import 'package:erickshawapp/features/current_user/presentation/bloc/user_state.dart';
import 'package:erickshawapp/shared/toast_alert.dart';
import 'package:flutter/material.dart';

import '../../domain/usecase/create_user.usecase.dart';
import '../../domain/usecase/delete_user.usecase.dart';
import '../../domain/usecase/get_user_info.usecase.dart';
import '../../domain/usecase/update_user.usecase.dart';

class UserCubit extends Cubit<UserState> {
  final GetUserUseCase getUserUseCase;
  final CreateUserUseCase createUserUseCase;
  final UpdateUserUseCase updateUserUseCase;
  final DeleteUserUseCase deleteUserUseCase;

  UserCubit({
    required this.getUserUseCase,
    required this.createUserUseCase,
    required this.updateUserUseCase,
    required this.deleteUserUseCase,
  }) : super(UserState());

  // late AuthUser? authUser;

  Future<void> fetchUser(String email) async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = await getUserUseCase.call(email);
      if (user != null) {
        emit(state.copyWith(isLoading: false, authUser: user));
      } else {
        emit(state.copyWith(isLoading: false));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> addUser(AuthUser authUser) async {
    emit(state.copyWith(isLoading: true));
    try {
      await createUserUseCase.call(authUser);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> updateUser(AuthUser authUser) async {
    emit(state.copyWith(isLoading: true));
    try {
     await updateUserUseCase.call(authUser);
      emit(state.copyWith(
          isLoading: false,
          authUser: AuthUser(
              id: '',
              email: authUser.email,
              photoURL: authUser.photoURL,
              phone: authUser.phone,
              name: authUser.name)));
      showSnackbar('Successfully Updated', Colors.green);
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      showSnackbar(e.toString(), Colors.red);
    }
  }

  Future<void> deleteUser(String userId) async {
    emit(state.copyWith(isLoading: true));
    try {
      await deleteUserUseCase.call(userId);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
