class ApiEndpoint {
  ApiEndpoint._();
  static const baseURL = "http://10.1.8.99:5000";
  // static const baseURL = "http://192.168.1.66:5000";
  static const int receiveTimeout = 25000;
  static const int connectionTimeout = 25000;
  static const header = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

//* ADMIN URLS
  static const adminProfileURL = "/api/Admin/details/getDetails";

  static const adminLoginURL = "/api/admin/auth/login";
  static const adminAddDetailURL = "/api/admin/details/addDetails";
  static const adminRegisterURL = "/api/admin/auth/register";
  static const adminGetDetailsURL = "/api/admin/details/getDetails";
  static const adminUpdateDetailsURL = "/api/admin/details/updateDetails";

  //* Auth change password

  static const adminChangePasswordURL = "/api/admin/auth/update";
  static const studentChangePasswordURL = "/api/student/auth/update";
  static const facultyChangePasswordURL = "/api/faculty/auth/update";

  //* STUDENT DASHBOARD URLS
  static const studentLoginURL = "/api/student/auth/login";
  static const studentGetDetailsURL = "/api/Student/details/getDetails";
  static const studentGetMarksURL = "/api/marks/getMarks";
  static const studentGetMaterialURL = "/api/material/getMaterial";
  static const studentGetNoticeURL = "/api/notice/getNotice";
//* STUDENT
  static const getStudentDetailsURL = "/api/student/details/getDetails";
  static const addStudentDetailsURL = "/api/student/details/addDetails";
  static const studentRegisterURL = "/api/student/auth/register";
  static const updateStudentURL = "/api/student/details/updateDetails";

//*TIMETABLE
  static const getTimetableURL = "/api/timetable/getTimetable";
  static const postTimetableURL = "/api/timetable/addTimetable";

//* SUBJECT
  static const getSubjectURL = "/api/subject/getSubject";
  static const addSubjectURL = "/api/subject/addSubject";
  static const deleteSubjectURL = "/api/subject/deleteSubject";

//* Marks
  static const addmarksURL = "/api/marks/addMarks";
  static const getmarksURL = "/api/marks/getMarks";

//* BRANCH
  static const getBranchURL = "/api/branch/getBranch";
  static const addBranchURL = "/api/branch/addBranch";
  static const deleteBranchURL = "/api/branch/deleteBranch";

//* MATERIAL
  static const getMaterialURL = "/api/material/getMaterial";
  static const addMaterialURL = "/api/material/addMaterial";

  //* NOTICE
  static const getNoticeURL = "/api/notice/getNotice";
  static const addNoticeURL = "/api/notice/addNotice";
  static const deleteNoticeURL = "/api/notice/deleteNotice";
  static const updateNoticeURL = "/api/notice/updateNotice";

  //* FACULTY URLS
  static const facultyLoginURL = "/api/faculty/auth/login";
  static const facultyGetDetailsURL = "/api/Faculty/details/getDetails";

  static const getFacultyURL = "/api/faculty/details/getDetails";
  static const addFacultyURL = "/api/faculty/details/addDetails";
  static const updateFacultyURL = "/api/faculty/details/updateDetails";
  static const registerFacultyURL = "/api/faculty/auth/register";
}
