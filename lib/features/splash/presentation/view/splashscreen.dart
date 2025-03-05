import 'dart:developer';

import 'package:college_community/features/auth/data/datasource/local_datasource/auth_local_datasource.dart';
import 'package:college_community/features/auth/data/model/response/login_response_model.dart';
import 'package:college_community/features/auth/presentation/view/login_dashboard_screen.dart';
import 'package:college_community/features/dashboards/admin_dashboard/presentation/view/admin_dashboard_screen.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/faculty_dashboard_screen.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view_model/cubit/faculty_dashboard_cubit.dart';
import 'package:college_community/features/dashboards/student_dashboard/presentation/view/student_dashboard_screen.dart';
import 'package:college_community/features/marks/presentation/view_model.dart/cubit/marks_cubit.dart';
import 'package:college_community/features/onboarding/data/datasource/local_datasource/onboarding_local_datasource.dart';
import 'package:college_community/features/onboarding/presentation/view/obboarding_screen.dart';
import 'package:college_community/features/student/domain/entity/reqeust/student_add_details_faculty_params.dart';
import 'package:college_community/features/student/presentation/view_model/cubit/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_images.dart';

class SplashscreenView extends StatefulWidget {
  const SplashscreenView({super.key});

  @override
  State<SplashscreenView> createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {
  @override
  void initState() {
    super.initState();
    retrieveUserRole();
  }

  void retrieveUserRole() async {
    UserRole? role = AuthLoginCheckService.getAuthLoginCheck();

    if (role != null) {
      Future.delayed(const Duration(seconds: 3), () async {
        LoginResponseModel? userLoginId = await AuthLocalService.getAuthLocalServie();
        log("SPALCH ::$role");
        log("SPALCH  userLoginId::$userLoginId");

        if (mounted) {
          switch (role) {
            case UserRole.student:
              context.read<StudentCubit>().studentGetDetials(params: StudentGetDetilsParams(enrollmentNo: userLoginId?.loginid), context: context);
              context.read<MarksCubit>().getMarks(enrollmentNo: userLoginId!.loginid!);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const StudentDashboardScreen()),
              );
              break;
            case UserRole.faculty:
              context.read<FacultyDashboardCubit>().getUserDetials(enrollmentNo: userLoginId!.loginid!);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const FacultyDashboardScreen()),
              );
              break;
            case UserRole.admin:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AdminDashboardScreen()),
              );
              break;
            default:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginDashBoard()),
              );
              break;
          }
        }
      });
    } else {
      log("No user role found.");
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          OnBoardingService.getOnboarding() == true
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()),
                )
              : Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginDashBoard()),
                );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.splashImage,
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 20),
            Text(
              'College Community',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
