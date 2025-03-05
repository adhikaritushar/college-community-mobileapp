class LoginParams {
  final String loginID;
  final String password;
  final String? id;

  LoginParams({
    required this.loginID,
    required this.password,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loginid': loginID,
      'password': password,
    };
  }

  factory LoginParams.fromMap(Map<String, dynamic> map) {
    return LoginParams(
      loginID: map['loginid'] as String,
      password: map['password'] as String,
    );
  }
}
