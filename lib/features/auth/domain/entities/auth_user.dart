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
    this.phone,
  });

  static const AuthUser empty = AuthUser(
    id: '',
    name: '',
    email: '',
    photoURL: '',
    phone: '',
  );

  bool get isEmpty => this == AuthUser.empty;

  @override
  List<Object?> get props => [id, name, email, photoURL, phone];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'photoURL': photoURL,
      'phone': phone,
    };
  }

  factory AuthUser.fromMap(Map<String, dynamic>? data) {
    if (data == null) {
      throw Exception('Data is null');
    }
    return AuthUser(
      id: data['id'],
      email: data['email'],
      name: data['name'],
      photoURL: data['photoURL'],
      phone: data['phone'],
    );
  }

  AuthUser copyWith({
    String? id,
    String? email,
    String? name,
    String? photoURL,
    String? phone,
  }) {
    return AuthUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      photoURL: photoURL ?? this.photoURL,
      phone: phone ?? this.phone,
    );
  }
}
