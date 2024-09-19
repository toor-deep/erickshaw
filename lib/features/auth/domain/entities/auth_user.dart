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

  // Convert AuthUser to Map (for Firestore)
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
}
