import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class ImageHelper {
  static final _picker = ImagePicker();

  // Pick image from gallery
  static Future<XFile?> imageHandler() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return null;
    return pickedFile;
  }

  // Compress and save image locally
  static Future<File?> compressAndSave(File file) async {
    final dir = await getApplicationDocumentsDirectory();
    final folder = Directory(p.join(dir.path, 'products_img'));
    if (!await folder.exists()) {
      await folder.create(recursive: true);
    }

    final targetPath = p.join(
      folder.path,
      '${DateTime.now().millisecondsSinceEpoch}.jpg',
    );

    final compressed = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 70, // adjust compression level
    );

    return File(compressed!.path);
  }
}
