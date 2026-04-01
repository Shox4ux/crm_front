import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FileHelper {
  static Future<File?> fileHandler() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'webp'],
      );
      if (result == null || result.files.isEmpty) return null;
      return File(result.files.single.path!);
    } catch (e) {
      throw Exception('Failed to pick file: $e');
    }
  }
}
