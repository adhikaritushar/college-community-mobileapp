import 'dart:math';

import 'package:college_community/config/theme/text_style.dart';
import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/features/auth/data/datasource/local_datasource/auth_local_datasource.dart';
import 'package:college_community/features/auth/data/model/response/login_response_model.dart';
import 'package:college_community/features/auth/presentation/view/login_dashboard_screen.dart';
import 'package:college_community/features/dashboards/student_dashboard/presentation/helpers/student_helpers.dart';
import 'package:college_community/features/dashboards/student_dashboard/presentation/view/categories/student_marks.dart';
import 'package:college_community/features/dashboards/student_dashboard/presentation/view/categories/student_materials.dart';
import 'package:college_community/features/dashboards/student_dashboard/presentation/view/categories/student_notice.dart';
import 'package:college_community/features/dashboards/student_dashboard/presentation/view/categories/profile/student_profile.dart';
import 'package:college_community/features/dashboards/student_dashboard/presentation/view/categories/student_timetable.dart';
import 'package:college_community/features/marks/presentation/view_model.dart/cubit/marks_cubit.dart';
import 'package:college_community/features/notice/presentation/view_model/cubit/notice_cubit.dart';
import 'package:college_community/features/subject/presentation/view_model/cubit/subject_cubit.dart';
import 'package:college_community/features/timetable/presentation/view_model/cubit/timetable_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_plus/sensors_plus.dart';

class StudentDashboardScreen extends StatefulWidget {
  const StudentDashboardScreen({super.key});

  @override
  State<StudentDashboardScreen> createState() => _StudentDashboardScreenState();
}

class _StudentDashboardScreenState extends State<StudentDashboardScreen> {
  final double shakeThreshold = 30.0;
  bool isShaking = false;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((event) {
      _detectShake(event);
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

  void _getMarks() async {
    LoginResponseModel? userdata = await AuthLocalService.getAuthLocalServie();
    context.read<MarksCubit>().getMarks(enrollmentNo: userdata!.loginid!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: "Student Dashboard",
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
          itemCount: StudentDashboardHelper.studentCategories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final category = StudentDashboardHelper.studentCategories[index];

            return InkWell(
              onTap: () {
                switch (category) {
                  case StudentDashboardHelper.myprofile:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentProfile()));
                    break;
                  case StudentDashboardHelper.timetable:
                    context.read<TimetableCubit>().getTimetable();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentTimetable()));
                    break;
                  case StudentDashboardHelper.marks:
                    _getMarks();

                    Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentMarks()));
                    break;
                  case StudentDashboardHelper.material:
                    context.read<SubjectCubit>().getSubject();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentMaterials()));
                    break;
                  case StudentDashboardHelper.notice:
                    context.read<NoticeCubit>().getNotice(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentNotice()));
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
                      _getCategoryIcon(category),
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

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case StudentDashboardHelper.myprofile:
        return Icons.person;
      case StudentDashboardHelper.timetable:
        return Icons.schedule;
      case StudentDashboardHelper.marks:
        return Icons.score;
      case StudentDashboardHelper.material:
        return Icons.book;
      case StudentDashboardHelper.notice:
        return Icons.notifications;
      default:
        return Icons.category;
    }
  }
}
