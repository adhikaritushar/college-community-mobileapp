import 'package:college_community/core/network_services/local_service/hive/hive_boxname.dart';
import 'package:college_community/features/auth/data/model/response/login_response_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future<void> setUpHive() async {
  var dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);

  Hive.registerAdapter(LoginResponseModelAdapter());
  await Future.wait([
    Hive.openBox<bool>(HiveBoxesName.onBoardingBox),
    Hive.openBox<int>(HiveBoxesName.authloginCheckBox),
    Hive.openBox<LoginResponseModel>(HiveBoxesName.authlocalBox),
  ]);
}
