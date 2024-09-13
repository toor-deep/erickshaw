
import 'package:equatable/equatable.dart';

import '../../../domain/entities/auth_user.dart';
import '../sign_in/sign_in_state.dart';

class SignUpState extends Equatable {
  final String? email;
  final String? password;
  final EmailStatus emailStatus;
  final PasswordStatus passwordStatus;
  final FormStatus formStatus;
  final bool isLoading;
  final AuthUser? authUser;

  const SignUpState({
    this.email,
    this.password,
    this.isLoading=false,
    this.emailStatus = EmailStatus.unknown,
    this.passwordStatus = PasswordStatus.unknown,
    this.formStatus = FormStatus.initial,
    this.authUser
  });

  SignUpState copyWith({
    String? email,
   String? password,
    EmailStatus? emailStatus,
    PasswordStatus? passwordStatus,
    FormStatus? formStatus,
    bool? isLoading,
    AuthUser? authUser
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailStatus: emailStatus ?? this.emailStatus,
      passwordStatus: passwordStatus ?? this.passwordStatus,
      formStatus: formStatus ?? this.formStatus,
      isLoading: isLoading ?? this.isLoading,
      authUser: authUser ?? this.authUser
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    emailStatus,
    passwordStatus,
    formStatus,
    isLoading
  ];
}