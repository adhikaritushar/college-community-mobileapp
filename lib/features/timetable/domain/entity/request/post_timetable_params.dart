import 'dart:io';

class PostTimetableParams {
  final String branch;
  final String semester;
  final String type;
  final File timeTableFile;

  PostTimetableParams({required this.branch, required this.semester, required this.type, required this.timeTableFile});
}
