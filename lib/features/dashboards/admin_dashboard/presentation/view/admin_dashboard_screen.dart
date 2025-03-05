import 'dart:math';

import 'package:college_community/config/theme/text_style.dart';
import 'package:college_community/core/common_widgets/k_appbar.dart';
import 'package:college_community/features/auth/data/datasource/local_datasource/auth_local_datasource.dart';
import 'package:college_community/features/auth/data/model/response/login_response_model.dart';
import 'package:college_community/features/auth/presentation/view/login_dashboard_screen.dart';
import 'package:college_community/features/branch/presentation/view_model/cubit/branch_cubit.dart';
import 'package:college_community/features/dashboards/admin_dashboard/presentation/helpers/admin_dashboard_helper.dart';
import 'package:college_community/features/dashboards/admin_dashboard/presentation/view/categories/admin/admin_screen.dart';
import 'package:college_community/features/dashboards/admin_dashboard/presentation/view/categories/branch/admin_branch_screen.dart';
import 'package:college_community/features/dashboards/admin_dashboard/presentation/view/categories/faculty/admin_faculty_screen.dart';
import 'package:college_community/features/dashboards/admin_dashboard/presentation/view/categories/notice/admin_notice.dart';
import 'package:college_community/features/dashboards/admin_dashboard/presentation/view/categories/profile/admin_profile.dart';
import 'package:college_community/features/dashboards/admin_dashboard/presentation/view/categories/student/admin_student_screen.dart';
import 'package:college_community/features/dashboards/admin_dashboard/presentation/view/categories/subject/admin_subject_screen.dart';
import 'package:college_community/features/dashboards/admin_dashboard/presentation/view_model/cubit/admin_dashboard_cubit.dart';
import 'package:college_community/features/notice/presentation/view_model/cubit/notice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
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

  void _getAdminDashboardProfile() async {
    LoginResponseModel? userdata = await AuthLocalService.getAuthLocalServie();
    context.read<AdminDashboardCubit>().adminDashboardProfile(employeeId: userdata!.loginid!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: "Admin Dashboard",
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
          itemCount: AdminDashboardHelper.adminCategories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final category = AdminDashboardHelper.adminCategories[index];

            return InkWell(
              onTap: () {
                switch (category) {
                  case AdminDashboardHelper.profile:
                    _getAdminDashboardProfile();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminProfile()));
                    break;
                  case AdminDashboardHelper.student:
                    context.read<BranchCubit>().getBranch();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminStudentScreen()));
                    break;
                  case AdminDashboardHelper.faculty:
                    context.read<BranchCubit>().getBranch();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminFacultyScreen()));
                    break;
                  case AdminDashboardHelper.branch:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminBranchScreen()));
                    break;
                  case AdminDashboardHelper.notice:
                    context.read<NoticeCubit>().getNotice(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminNotice()));
                    break;
                  case AdminDashboardHelper.subject:
                    context.read<NoticeCubit>().getNotice(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminSubjectScreen()));
                    break;
                  case AdminDashboardHelper.admins:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminScreen()));
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
      case AdminDashboardHelper.profile:
        return Icons.person;
      case AdminDashboardHelper.student:
        return Icons.schedule;
      case AdminDashboardHelper.faculty:
        return Icons.score;
      case AdminDashboardHelper.branch:
        return Icons.book;
      case AdminDashboardHelper.notice:
        return Icons.notifications;
      case AdminDashboardHelper.subject:
        return Icons.subject;
      case AdminDashboardHelper.admins:
        return Icons.admin_panel_settings;
      default:
        return Icons.category;
    }
  }
}
