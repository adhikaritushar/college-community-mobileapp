class FacultyDashboardHelper {
  static const String myprofile = "My Profile";
  static const String studentInfo = "Student Info";
  static const String uploadMarks = "Upload Marks";
  static const String timetable = "TimeTable";
  static const String notice = "Notice";
  static const String material = "Material";

  static const List<String> facultyCategories = [
    myprofile,
    studentInfo,
    uploadMarks,
    timetable,
    notice,
    material,
  ];
}

String getSemesterValue(String semester) {
  switch (semester) {
    case '1st Semester':
      return "1";
    case '2nd Semester':
      return "2";
    case '3rd Semester':
      return "3";
    case '4th Semester':
      return "4";
    case '5th Semester':
      return "5";
    case '6th Semester':
      return "6";
    case '7th Semester':
      return "7";
    case '8th Semester':
      return "8";
    default:
      throw ArgumentError('Invalid semester: $semester');
  }
}

String getSemesterName(String semesterNumber) {
  switch (semesterNumber) {
    case '1':
      return "1st Semester";
    case '2':
      return "2nd Semester";
    case '3':
      return "3rd Semester";
    case '4':
      return "4th Semester";
    case '5':
      return "5th Semester";
    case '6':
      return "6th Semester";
    case '7':
      return "7th Semester";
    case '8':
      return "8th Semester";
    default:
      throw ArgumentError('Invalid semester number: $semesterNumber');
  }
}
