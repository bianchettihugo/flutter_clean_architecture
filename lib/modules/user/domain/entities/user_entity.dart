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
}
