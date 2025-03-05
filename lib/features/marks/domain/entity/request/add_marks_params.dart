class AddMarksParams {
  final String enrollmentNo;
  final Map<String, String> examType;
  final bool? isInternal;

  AddMarksParams({
    required this.enrollmentNo,
    required this.examType,
    this.isInternal,
  });
}
