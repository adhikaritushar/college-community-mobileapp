// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:college_community/features/auth/domain/entities/response/login_response_entity.dart';
import 'package:hive/hive.dart';

part 'login_response_model.g.dart';

@HiveType(typeId: 1)
class LoginResponseModel {
  @HiveField(1)
  final bool? success;
  @HiveField(2)
  final String? message;
  @HiveField(3)
  final int? loginid;
  @HiveField(4)
  final String? id;

  LoginResponseModel({
    this.success,
    this.message,
    this.loginid,
    this.id,
  });

  factory LoginResponseModel.fromMap(Map<String, dynamic> json) => LoginResponseModel(
        success: json["success"],
        message: json["message"],
        loginid: json["loginid"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "loginid": loginid,
        "id": id,
      };

  @override
  String toString() {
    return 'LoginResponseModel(success: $success, message: $message, loginid: $loginid, id: $id)';
  }

  @override
  bool operator ==(covariant LoginResponseModel other) {
    if (identical(this, other)) return true;

    return other.success == success && other.message == message && other.loginid == loginid && other.id == id;
  }

  @override
  int get hashCode {
    return success.hashCode ^ message.hashCode ^ loginid.hashCode ^ id.hashCode;
  }
}

extension LoginResponseModelHelper on LoginResponseEntity {
  LoginResponseModel toModel() => LoginResponseModel(
        success: success,
        message: message,
        loginid: loginid,
        id: id,
      );
}

extension LoginResponseEntityHelper on LoginResponseModel {
  LoginResponseEntity toEntity() => LoginResponseEntity(
        success: success,
        message: message,
        loginid: loginid,
        id: id,
      );
}
