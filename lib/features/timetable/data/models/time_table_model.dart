import 'package:college_community/features/timetable/domain/entity/time_table_entity.dart';

class TimetableModel extends TimetableEntity {
  TimetableModel({
    super.id,
    super.link,
    super.branch,
    super.semester,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  static List<TimetableModel> listfromJson(List<dynamic> data) {
    return data.map((e) => TimetableModel.fromMap(e)).toList();
  }

  factory TimetableModel.fromMap(Map<String, dynamic> json) => TimetableModel(
        id: json["_id"],
        link: json["link"],
        branch: json["branch"],
        semester: json["semester"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "link": link,
        "branch": branch,
        "semester": semester,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}
