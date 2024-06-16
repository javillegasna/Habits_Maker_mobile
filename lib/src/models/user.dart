import 'dart:typed_data';

class User {
  final int id;
  final String userName;
  final String email;
  final String password;
  final Uint8List? userImage;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    this.userImage,
  });

  // Convert a User into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_name': userName,
      'email': email,
      'password': password,
      'user_image': userImage,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  // Extract a User object from a Map object. The keys must correspond to the
  // names of the columns in the database.
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      userName: map['user_name'],
      email: map['email'],
      password: map['password'],
      userImage: map['user_image'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }
}
