abstract class AuthenticationEvent {}

class RegisterEvent extends AuthenticationEvent{
  String email;
  String password;
  String confirmPassword;
  String phone;

  RegisterEvent({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
  });
}
