import 'package:college_community_main/app/app.dart';
import 'package:college_community_main/app/di/di.dart';
import 'package:college_community_main/core/network/hive_service.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  // await HiveService().clearStudentBox();

  await initDependencies();

  runApp(
    App(),
  );
}
