class User {
  final int id;
  final String username;
  final String passwordHash;
  final String role; // "admin" or "subadmin"
  final String? secretWord; // only for subadmin
  final DateTime createdAt;

  User({
    required this.id,
    required this.username,
    required this.passwordHash,
    required this.role,
    this.secretWord,
    required this.createdAt,
  });
}
