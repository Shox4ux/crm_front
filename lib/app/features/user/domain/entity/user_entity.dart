class UserEntity {
  final int? id;
  final String? username;
  final int? role;
  final String? img;
  final String? phone;
  final bool? isActive;
  final String? address;
  final DateTime? createdAt;

  const UserEntity({
    this.id,
    this.username,
    this.role,
    this.img,
    this.phone,
    this.isActive,
    this.address,
    this.createdAt,
  });
}
