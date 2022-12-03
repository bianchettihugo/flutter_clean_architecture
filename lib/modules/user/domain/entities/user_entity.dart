class UserEntity {
  final String name;
  final String email;
  final String password;
  final String photoUrl;

  const UserEntity({
    required this.name,
    required this.email,
    this.password = '',
    this.photoUrl = '',
  });

  bool get isEmailValid => RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*",
      ).hasMatch(email);

  bool get isPasswordValid => password.length > 4;

  bool get isNameValid => name.isNotEmpty;

  @override
  bool operator ==(covariant UserEntity other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.password == password &&
        other.photoUrl == photoUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        photoUrl.hashCode;
  }
}
