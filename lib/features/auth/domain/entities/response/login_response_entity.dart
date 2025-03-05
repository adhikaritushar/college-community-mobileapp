// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginResponseEntity {
  final bool? success;
  final String? message;
  final int? loginid;
  final String? id;

  LoginResponseEntity({
    this.success,
    this.message,
    this.loginid,
    this.id,
  });

  @override
  String toString() {
    return 'LoginResponseEntity(success: $success, message: $message, loginid: $loginid, id: $id)';
  }

  @override
  bool operator ==(covariant LoginResponseEntity other) {
    if (identical(this, other)) return true;

    return other.success == success && other.message == message && other.loginid == loginid && other.id == id;
  }

  @override
  int get hashCode {
    return success.hashCode ^ message.hashCode ^ loginid.hashCode ^ id.hashCode;
  }
}
