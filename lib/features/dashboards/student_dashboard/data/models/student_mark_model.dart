// import 'package:college_community/features/student_dashboard/domain/entity/student_mark_entity.dart';

// class StudentMarkModel extends StudentMarkEntity {
//   StudentMarkModel({
//     super.id,
//     super.enrollmentNo,
//     super.createdAt,
//     super.internal,
//     super.external,
//     super.updatedAt,
//     super.v,
//   });

//   factory StudentMarkModel.fromMap(Map<String, dynamic> json) => StudentMarkModel(
//         id: json["_id"],
//         enrollmentNo: json["enrollmentNo"],
//         internal: json["internal"] != null ? Map<String, String>.from(json["internal"]) : null,
//         createdAt: json["createdAt"],
//         updatedAt: json["updatedAt"],
//         v: json["__v"],
//         external: json["external"] != null ? Map<String, String>.from(json["external"]) : null,
//       );

//   Map<String, dynamic> toMap() => {
//         "_id": id,
//         "enrollmentNo": enrollmentNo,
//         "internal": internal,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//         "__v": v,
//         "external": external,
//       };

//   static List<StudentMarkModel> listfromJson(List<dynamic> data) {
//     return data.map((e) => StudentMarkModel.fromMap(e)).toList();
//   }
// }
