// import 'package:college_community/features/student_dashboard/domain/entity/student_subject_entity.dart';

// class SubjectModel extends SubjectEntity {
//   SubjectModel({
//     super.id,
//     super.name,
//     super.code,
//     super.createdAt,
//     super.updatedAt,
//     super.v,
//   });

//   static List<SubjectModel> listfromJson(List<dynamic> data) {
//     return data.map((e) => SubjectModel.fromMap(e)).toList();
//   }

//   factory SubjectModel.fromMap(Map<String, dynamic> json) => SubjectModel(
//         id: json["_id"],
//         name: json["name"],
//         code: json["code"],
//         createdAt: json["createdAt"],
//         updatedAt: json["updatedAt"],
//         v: json["__v"],
//       );

//   Map<String, dynamic> toMap() => {
//         "_id": id,
//         "name": name,
//         "code": code,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//         "__v": v,
//       };

//   @override
//   String toString() {
//     return 'SubjectModel(id: $id, name: $name, code: $code, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
//   }

//   @override
//   bool operator ==(covariant SubjectModel other) {
//     if (identical(this, other)) return true;

//     return other.id == id && other.name == name && other.code == code && other.createdAt == createdAt && other.updatedAt == updatedAt && other.v == v;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^ name.hashCode ^ code.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ v.hashCode;
//   }
// }
