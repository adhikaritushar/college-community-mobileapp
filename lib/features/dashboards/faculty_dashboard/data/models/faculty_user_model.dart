import 'package:college_community/features/dashboards/faculty_dashboard/domain/entity/faculty_user_entity.dart';

class FacultyUserModel extends FacultyUserEntity {
  FacultyUserModel({
    super.id,
    super.employeeId,
    super.firstName,
    super.middleName,
    super.lastName,
    super.email,
    super.phoneNumber,
    super.department,
    super.gender,
    super.experience,
    super.post,
    super.profile,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  static List<FacultyUserModel> listfromJson(List<dynamic> data) {
    return data.map((e) => FacultyUserModel.fromMap(e)).toList();
  }

  factory FacultyUserModel.fromMap(Map<String, dynamic> json) => FacultyUserModel(
        id: json["_id"],
        employeeId: json["employeeId"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        department: json["department"],
        gender: json["gender"],
        experience: json["experience"],
        post: json["post"],
        profile: json["profile"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "employeeId": employeeId,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "department": department,
        "gender": gender,
        "experience": experience,
        "post": post,
        "profile": profile,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}
