import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage({required ImageSource source}) async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(source: source);

  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return null;
}

class FileHelper {
  /// Picks an image from the gallery or camera.
  static Future<File?> pickImage({required ImageSource source}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  /// Picks a file (or multiple files) with optional file type filtering.
  static Future<List<File>> pickFiles({
    bool allowMultiple = false,
    List<String>? allowedExtensions, // Pass null for any file type
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: allowMultiple,
      type: allowedExtensions != null ? FileType.custom : FileType.any,
      allowedExtensions: ["jpg", "png", "pdf"],
    );

    if (result != null) {
      return result.files.map((file) => File(file.path!)).toList();
    }
    return [];
  }
}
