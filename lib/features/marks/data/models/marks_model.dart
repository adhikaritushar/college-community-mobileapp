import 'package:college_community/features/marks/domain/entity/marks_entity.dart';

class MarksModel extends MarksEntity {
  MarksModel({
    super.id,
    super.enrollmentNo,
    super.createdAt,
    super.internal,
    super.external,
    super.updatedAt,
    super.v,
  });

  factory MarksModel.fromMap(Map<String, dynamic> json) => MarksModel(
        id: json["_id"],
        enrollmentNo: json["enrollmentNo"],
        internal: json["internal"] != null ? Map<String, String>.from(json["internal"]) : null,
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
        external: json["external"] != null ? Map<String, String>.from(json["external"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "enrollmentNo": enrollmentNo,
        "internal": internal,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "external": external,
      };

  static List<MarksModel> listfromJson(List<dynamic> data) {
    return data.map((e) => MarksModel.fromMap(e)).toList();
  }
}
