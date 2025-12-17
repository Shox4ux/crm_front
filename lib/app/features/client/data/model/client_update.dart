import 'package:dio/dio.dart';

class ClientUpdate {
  final String? username;
  final MultipartFile? img;
  final String? phone;
  final String? address;
  final String? password;
  final bool? isActive;

  ClientUpdate({
    required this.username,
    required this.img,
    required this.phone,
    required this.address,
    required this.password,
    required this.isActive,
  });
}
