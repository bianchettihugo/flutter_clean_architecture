import 'package:equatable/equatable.dart';

import 'package:flutter_clean_architecture/modules/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity implements Equatable {
  const UserModel({
    required String name,
    required String email,
    String password = '',
    String photoUrl = '',
  }) : super(
          name: name,
          email: email,
          password: password,
          photoUrl: photoUrl,
        );

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        photoUrl,
      ];

  @override
  bool? get stringify => true;

  static Map<String, dynamic> toMap(UserEntity entity) {
    return <String, dynamic>{
      'name': entity.name,
      'email': entity.email,
      'password': entity.password,
      'photoUrl': entity.photoUrl,
    };
  }

  static UserEntity fromMap(Map<String, dynamic> map) {
    return UserEntity(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
    );
  }
}
