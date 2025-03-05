import 'package:hive/hive.dart';
import 'package:college_community/core/network_services/local_service/hive/hive_boxname.dart';
import 'package:college_community/core/network_services/local_service/hive/hive_keys.dart';

class OnBoardingService {
  static Future<void> setOnboarding({required bool isShowOnBoarding}) async {
    var box = Hive.box<bool>(HiveBoxesName.onBoardingBox);
    box.put(HiveKeys.onboardingKey, isShowOnBoarding);
  }

  static bool? getOnboarding() {
    var box = Hive.box<bool>(HiveBoxesName.onBoardingBox);
    return box.get(HiveKeys.onboardingKey, defaultValue: true);
  }
}
