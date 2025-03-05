import 'package:college_community/features/branch/domain/entity/branch_entity.dart';

class BranchModel extends BranchEntity {
  BranchModel({
    super.id,
    super.name,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  static List<BranchModel> listfromJson(List<dynamic> data) {
    return data.map((e) => BranchModel.fromMap(e)).toList();
  }

  factory BranchModel.fromMap(Map<String, dynamic> json) => BranchModel(
        id: json["_id"],
        name: json["name"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}
