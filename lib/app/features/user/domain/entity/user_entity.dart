class UserEntity {
  final int id;
  final String username;
  final String password;
  final String? hashedPassword;
  final bool isActive;
  final DateTime createdAt;

  UserEntity({
    required this.id,
    required this.username,
    required this.password,
    required this.hashedPassword,
    required this.isActive,
    required this.createdAt,
  });
}
