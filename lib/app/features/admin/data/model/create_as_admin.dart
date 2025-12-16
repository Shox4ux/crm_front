import 'package:dio/dio.dart';

class CreateAsAdmin {
  final String username;
  final MultipartFile? img;
  final String password;
  CreateAsAdmin({required this.username, this.img, required this.password});

  FormData toForm() {
    return FormData.fromMap({
      "username": username,
      "password": password,
      "img": img,
    });
  }
}
