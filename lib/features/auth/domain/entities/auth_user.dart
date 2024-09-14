import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String id;
  final String email;
  final String? name;
  final String? photoURL;
  final String? phone;

  const AuthUser({
    required this.id,
    required this.email,
    this.name,
    this.photoURL,
    this.phone
  });

  static const AuthUser empty = AuthUser(
    id: '',
    name: '',
    email: '',
    photoURL: '',
    phone: ''
  );

  bool get isEmpty => this == AuthUser.empty;

  @override
  List<Object?> get props => [id, name, email, photoURL,phone];
}
