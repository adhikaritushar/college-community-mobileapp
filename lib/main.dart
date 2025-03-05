import 'package:college_community/config/theme/theme.dart';
import 'package:college_community/core/dependency_injection/dependecy_injection.dart';
import 'package:college_community/core/network_services/local_service/hive/hive_setup.dart';
import 'package:college_community/features/admin/presentation/view_model.dart/cubit/admin_cubit.dart';
import 'package:college_community/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:college_community/features/branch/presentation/view_model/cubit/branch_cubit.dart';
import 'package:college_community/features/dashboards/admin_dashboard/presentation/view_model/cubit/admin_dashboard_cubit.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view_model/cubit/faculty_dashboard_cubit.dart';
import 'package:college_community/features/faculty/presentation/view_model/cubit/faculty_cubit.dart';
import 'package:college_community/features/marks/presentation/view_model.dart/cubit/marks_cubit.dart';
import 'package:college_community/features/material/presentation/view_model.dart/cubit/material_cubit.dart';
import 'package:college_community/features/notice/presentation/view_model/cubit/notice_cubit.dart';
import 'package:college_community/features/splash/presentation/view/splashscreen.dart';
import 'package:college_community/features/student/presentation/view_model/cubit/student_cubit.dart';
import 'package:college_community/features/subject/presentation/view_model/cubit/subject_cubit.dart';
import 'package:college_community/features/timetable/presentation/view_model/cubit/timetable_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await setUpHive();
  await setUpLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<AuthCubit>()),
        BlocProvider(create: (context) => locator<AdminCubit>()),
        BlocProvider(create: (context) => locator<FacultyDashboardCubit>()),
        BlocProvider(create: (context) => locator<BranchCubit>()),
        BlocProvider(create: (context) => locator<SubjectCubit>()),
        BlocProvider(create: (context) => locator<StudentCubit>()),
        BlocProvider(create: (context) => locator<MarksCubit>()),
        BlocProvider(create: (context) => locator<TimetableCubit>()),
        BlocProvider(create: (context) => locator<NoticeCubit>()),
        BlocProvider(create: (context) => locator<MaterialsCubit>()),
        BlocProvider(create: (context) => locator<AdminDashboardCubit>()),
        BlocProvider(create: (context) => locator<FacultyCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College Community',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      home: const SplashscreenView(),
    );
  }
}
