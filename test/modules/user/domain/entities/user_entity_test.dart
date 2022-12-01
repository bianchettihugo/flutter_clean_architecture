import 'package:flutter_clean_architecture/modules/user/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should check entity equality', () async {
    const user1 = UserEntity(name: 'name', email: 'email@email.com');
    const user2 = UserEntity(name: 'name', email: 'email@email.com');

    expect(user1, user2);
    expect(user1.hashCode, user2.hashCode);
  });

  group('Email validation', () {
    test('should return false when email is \'sdqopdqwd\'', () async {
      const user = UserEntity(name: 'name', email: 'sdqopdqwd');

      expect(user.isEmailValid, false);
    });

    test('should return false when email is \'email.com\'', () async {
      const user = UserEntity(name: 'name', email: 'email.com');

      expect(user.isEmailValid, false);
    });

    test('should return true when email is \'email@gmail.com\'', () async {
      const user = UserEntity(name: 'name', email: 'email@gmail.com');

      expect(user.isEmailValid, true);
    });

    test('should return true when email is \'email@gmail.com.br\'', () async {
      const user = UserEntity(name: 'name', email: 'email@gmail.com.br');

      expect(user.isEmailValid, true);
    });
  });

  group('Password validation', () {
    test('should return false when password is empty', () async {
      const user = UserEntity(name: '', email: '');

      expect(user.isPasswordValid, false);
    });

    test('should return false when password length is less than 5 characteres',
        () async {
      const user = UserEntity(name: '', email: '', password: '123');

      expect(user.isPasswordValid, false);
    });

    test(
        'should return true when password length is greater than 4 characteres',
        () async {
      const user = UserEntity(name: '', email: '', password: '12345');

      expect(user.isPasswordValid, true);
    });
  });

  group('Name validation', () {
    test('should return false when name is empty', () async {
      const user = UserEntity(name: '', email: '');

      expect(user.isNameValid, false);
    });

    test('should return true when name is not empty', () async {
      const user = UserEntity(name: 'Name', email: '');

      expect(user.isNameValid, true);
    });
  });
}
