import 'package:college_community/features/notice/domain/entities/notice_entity.dart';

class NoticeModel extends NoticeEntity {
  NoticeModel({
    super.id,
    super.title,
    super.description,
    super.type,
    super.link,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  static List<NoticeModel> listfromJson(List<dynamic> data) {
    return data.map((e) => NoticeModel.fromMap(e)).toList();
  }

  factory NoticeModel.fromMap(Map<String, dynamic> json) => NoticeModel(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        type: json["type"],
        link: json["link"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "title": title,
        "description": description,
        "type": type,
        "link": link,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}
