class FacultyRegisterEntity {
  final bool? success;
  final String? message;
  final int? loginid;
  final String? id;

  FacultyRegisterEntity({
    this.success,
    this.message,
    this.loginid,
    this.id,
  });

  factory FacultyRegisterEntity.fromMap(Map<String, dynamic> json) => FacultyRegisterEntity(
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
}
