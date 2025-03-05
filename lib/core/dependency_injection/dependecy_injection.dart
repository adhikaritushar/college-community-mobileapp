import 'dart:developer';

import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/core/network_services/remote_service/handler/dio_service.dart';
import 'package:college_community/features/admin/injection/admin_injection.dart';
import 'package:college_community/features/auth/injection/auth_injection.dart';
import 'package:college_community/features/branch/injection/branch_injection.dart';
import 'package:college_community/features/dashboards/admin_dashboard/injection/admin_dashboard_injection.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/injection/faculty_dashboard_injection.dart';
import 'package:college_community/features/faculty/injection/faculty_injection.dart';
import 'package:college_community/features/marks/injection/marks_injection.dart';
import 'package:college_community/features/material/injection/material_injection.dart';
import 'package:college_community/features/notice/injection/notice_injection.dart';
import 'package:college_community/features/student/injection/student_injection.dart';
import 'package:college_community/features/subject/injection/subject_injection.dart';
import 'package:college_community/features/timetable/injection/timetable_injection.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;
Future<void> setUpLocator() async {
  log('locator register');
  locator.registerLazySingleton(() => GenericApiHandler(dio: DioClient()));
  AuthInjection.register();
  AdminInjection.register();
  StudentInjection.register();
  FacultyDashboardInjection.register();
  BranchInjection.register();
  SubjectInjection.register();
  MarksInjection.register();
  TimetableInjection.register();
  NoticeInjection.register();
  MaterialInjection.register();
  AdminDashboardInjection.register();
  FacultyInjection.register();
}
