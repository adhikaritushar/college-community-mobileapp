import 'package:college_community/features/admin/domain/entities/response/admin_entity.dart';

class AdminModel extends AdminEntity {
  AdminModel({
    super.id,
    super.employeeId,
    super.firstName,
    super.middleName,
    super.lastName,
    super.email,
    super.phoneNumber,
    super.gender,
    super.profile,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  static List<AdminModel> listfromJson(List<dynamic> data) {
    return data.map((e) => AdminModel.fromMap(e)).toList();
  }

  factory AdminModel.fromMap(Map<String, dynamic> json) => AdminModel(
        id: json["_id"],
        employeeId: json["employeeId"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        gender: json["gender"],
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
        "gender": gender,
        "profile": profile,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}
