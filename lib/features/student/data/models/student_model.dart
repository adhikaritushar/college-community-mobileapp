import 'package:college_community/features/student/domain/entity/student_entity.dart';

class StudentModel extends StudentEntity {
  StudentModel({
    super.id,
    super.enrollmentNo,
    super.firstName,
    super.middleName,
    super.lastName,
    super.email,
    super.phoneNumber,
    super.semester,
    super.branch,
    super.gender,
    super.profile,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  static List<StudentModel> listfromJson(List<dynamic> data) {
    return data.map((e) => StudentModel.fromMap(e)).toList();
  }

  factory StudentModel.fromMap(Map<String, dynamic> json) => StudentModel(
        id: json["_id"],
        enrollmentNo: json["enrollmentNo"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        semester: json["semester"],
        branch: json["branch"],
        gender: json["gender"],
        profile: json["profile"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "enrollmentNo": enrollmentNo,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "semester": semester,
        "branch": branch,
        "gender": gender,
        "profile": profile,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}
