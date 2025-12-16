// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class CreateAsClient {
  final String username;
  final MultipartFile? img;
  final String phone;
  final String address;
  final String password;
  CreateAsClient({
    required this.username,
    this.img,
    required this.phone,
    required this.address,
    required this.password,
  });

  FormData toForm() {
    return FormData.fromMap({
      "username": username,
      "password": password,
      "phone": phone,
      "address": address,
      "img": img,
    });
  }
}
