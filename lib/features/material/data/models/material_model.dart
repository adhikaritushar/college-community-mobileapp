import 'package:college_community/features/material/domain/entity/material_entity.dart';

class MaterialModel extends MaterialEntity {
  MaterialModel({
    super.id,
    super.faculty,
    super.subject,
    super.title,
    super.link,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  static List<MaterialModel> listfromJson(List<dynamic> data) {
    return data.map((e) => MaterialModel.fromMap(e)).toList();
  }

  factory MaterialModel.fromMap(Map<String, dynamic> json) => MaterialModel(
        id: json["_id"],
        faculty: json["faculty"],
        subject: json["subject"],
        title: json["title"],
        link: json["link"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "faculty": faculty,
        "subject": subject,
        "title": title,
        "link": link,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}
