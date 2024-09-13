
import 'package:equatable/equatable.dart';
import 'package:erickshawapp/features/auth/domain/entities/auth_user.dart';

enum EmailStatus { unknown, valid, invalid }

enum FormStatus {
  initial,
  valid,
  invalid,
  submissionInProgress,
  submissionSuccess,
  submissionFailure,
}
enum PasswordStatus { unknown, valid, invalid }
class SignInState extends Equatable {
  final String? email;
  final String? password;
  final EmailStatus emailStatus;
  final PasswordStatus passwordStatus;
  final FormStatus formStatus;
  final bool isLoading;
  final AuthUser? authUser;

  const SignInState({
    this.email,
    this.password,
    this.isLoading=false,
    this.emailStatus = EmailStatus.unknown,
    this.passwordStatus = PasswordStatus.unknown,
    this.formStatus = FormStatus.initial,
    this.authUser,
  });

  SignInState copyWith({
   String? email,
    String? password,
    EmailStatus? emailStatus,
    PasswordStatus? passwordStatus,
    FormStatus? formStatus,
    bool? isLoading,
    AuthUser? authUser
  }) {
    return SignInState(
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