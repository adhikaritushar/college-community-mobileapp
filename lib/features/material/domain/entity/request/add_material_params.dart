import 'dart:io';

class AddMaterialParams {
  final String title;
  final String subject;
  final String? faculty;
  final String? type;
  final File materialFile;

  AddMaterialParams({
    required this.title,
    required this.subject,
    this.faculty,
    this.type,
    required this.materialFile,
  });
}
