import 'dart:async';
import 'dart:math';

import 'package:college_community/config/theme/text_style.dart';
import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/features/auth/data/datasource/local_datasource/auth_local_datasource.dart';
import 'package:college_community/features/auth/presentation/view/login_dashboard_screen.dart';
import 'package:college_community/features/branch/presentation/view_model/cubit/branch_cubit.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/helpers/faculty_helpers.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/faculty_material.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/faculty_student_info.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/faculty_time_table.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/faculty_upload_marks.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/notice/faculty_notice.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/profile/faculty_profile.dart';
import 'package:college_community/features/notice/presentation/view_model/cubit/notice_cubit.dart';
import 'package:college_community/features/subject/presentation/view_model/cubit/subject_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_plus/sensors_plus.dart';

class FacultyDashboardScreen extends StatefulWidget {
  const FacultyDashboardScreen({super.key});

  @override
  State<FacultyDashboardScreen> createState() => _FacultyDashboardScreenState();
}

class _FacultyDashboardScreenState extends State<FacultyDashboardScreen> {
  late StreamSubscription<AccelerometerEvent> _accelerometerSubscription;
  final double shakeThreshold = 30.0;
  bool isShaking = false;

  @override
  void initState() {
    super.initState();
    _accelerometerSubscription = accelerometerEvents.listen((event) {
      if (mounted) {
        _detectShake(event);
      }
    });
  }

  void _detectShake(AccelerometerEvent event) {
    double acceleration = sqrt(event.x * event.x + event.y * event.y + event.z * event.z);

    if (acceleration > shakeThreshold && !isShaking) {
      setState(() {
        isShaking = true;
      });
      _triggerLogout();
    }
  }

  void _triggerLogout() {
    AuthLoginCheckService.logout();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginDashBoard()),
      (route) => false,
    );

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isShaking = false;
      });
    });
  }

  @override
  void dispose() {
    _accelerometerSubscription.cancel(); // Cancel the accelerometer listener
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: "Faculty Dashboard",
        actions: [
          IconButton(
            onPressed: () async {
              AuthLoginCheckService.logout();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginDashBoard(),
                ),
                (route) => false,
              );
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: FacultyDashboardHelper.facultyCategories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final category = FacultyDashboardHelper.facultyCategories[index];

            return InkWell(
              onTap: () {
                switch (category) {
                  case FacultyDashboardHelper.myprofile:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FacultyProfile()));
                    break;
                  case FacultyDashboardHelper.studentInfo:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FacultyStudentInfo()));
                    break;
                  case FacultyDashboardHelper.uploadMarks:
                    context.read<BranchCubit>().getBranch();
                    context.read<SubjectCubit>().getSubject();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FacultyUploadMarks()));
                    break;
                  case FacultyDashboardHelper.timetable:
                    context.read<BranchCubit>().getBranch();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FacultyTimeTable()));
                    break;
                  case FacultyDashboardHelper.notice:
                    context.read<NoticeCubit>().getNotice(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FacultyNotice()));
                    break;
                  case FacultyDashboardHelper.material:
                    context.read<SubjectCubit>().getSubject();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FacultyMatrial()));
                    break;
                  default:
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent.withOpacity(0.6), Colors.blue.shade900.withOpacity(0.6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _getIconForCategory(category),
                      size: 40,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      category,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textStyle(
                        context: context,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// Returns an appropriate icon for each category
  IconData _getIconForCategory(String category) {
    switch (category) {
      case FacultyDashboardHelper.myprofile:
        return Icons.person;
      case FacultyDashboardHelper.studentInfo:
        return Icons.group;
      case FacultyDashboardHelper.uploadMarks:
        return Icons.upload;
      case FacultyDashboardHelper.timetable:
        return Icons.schedule;
      case FacultyDashboardHelper.notice:
        return Icons.notifications;
      case FacultyDashboardHelper.material:
        return Icons.book;
      default:
        return Icons.category;
    }
  }
}
