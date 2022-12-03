import 'package:flutter_clean_architecture/modules/user/data/models/user_model.dart';
import 'package:flutter_clean_architecture/modules/user/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should check user model equality', () async {
    const user1 = UserModel(name: 'Name', email: 'email@gmail.com');
    const user2 = UserModel(name: 'Name', email: 'email@gmail.com');
    user1.stringify;

    expect(user1, user2);
  });

  test('should create a map from entity', () async {
    const user1 = UserEntity(name: 'Name', email: 'email@gmail.com');
    const map = {
      'name': 'Name',
      'email': 'email@gmail.com',
      'password': '',
      'photoUrl': '',
    };

    expect(UserModel.toMap(user1), map);
  });

  test('should create an entity from map', () async {
    const user1 = UserEntity(name: 'Name', email: 'email@gmail.com');
    const user2 = UserEntity(name: '', email: '');
    const map = {
      'name': 'Name',
      'email': 'email@gmail.com',
      'password': '',
      'photoUrl': '',
    };
    const map2 = <String, dynamic>{};

    expect(UserModel.fromMap(map), user1);
    expect(UserModel.fromMap(map2), user2);
  });
}
