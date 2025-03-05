import 'package:college_community/core/network_services/local_service/hive/hive_boxname.dart';
import 'package:college_community/features/auth/data/model/response/login_response_model.dart';
import 'package:hive/hive.dart';

enum UserRole {
  student,
  faculty,
  admin,
}

class AuthLoginCheckService {
  static const String _authkey = "_authkey";

  static Future<void> setAuthLoginCheck({required UserRole userRole}) async {
    var box = Hive.box<int>(HiveBoxesName.authloginCheckBox);
    await box.put(_authkey, userRole.index);
  }

  static UserRole? getAuthLoginCheck() {
    var box = Hive.box<int>(HiveBoxesName.authloginCheckBox);
    int? roleIndex = box.get(_authkey);

    if (roleIndex != null) {
      return UserRole.values[roleIndex];
    }
    return null;
  }

  static Future<void> logout() async {
    var box = Hive.box<int>(HiveBoxesName.authloginCheckBox);
    await box.delete(_authkey);
  }
}

class AuthLocalService {
  static const String _authlocalkey = "_authlocalkey";

  static Future<void> setAuthLocalServie({required LoginResponseModel loginRes}) async {
    var box = Hive.box<LoginResponseModel>(HiveBoxesName.authlocalBox);
    await box.put(_authlocalkey, loginRes);
  }

  static Future<LoginResponseModel?> getAuthLocalServie() async {
    var box = Hive.box<LoginResponseModel>(HiveBoxesName.authlocalBox);
    return box.get(_authlocalkey);
  }
}
  // static Future<void> setAuthLocalServie({required int loginID}) async {
  //   var box = Hive.box<int>(HiveBoxesName.authlocalBox);
  //   await box.put(_authlocalkey, loginID);
  // }

  // static int? getAuthLocalServie() {
  //   var box = Hive.box<int>(HiveBoxesName.authlocalBox);
  //   return box.get(_authlocalkey);
  // }