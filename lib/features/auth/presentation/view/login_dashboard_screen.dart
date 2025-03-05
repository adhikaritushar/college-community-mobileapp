import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:college_community/features/auth/presentation/helpers/auth_helper.dart';
import 'package:college_community/features/auth/presentation/view/login_screen.dart';
import 'package:college_community/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class LoginDashBoard extends StatefulWidget {
  const LoginDashBoard({super.key});

  @override
  State<LoginDashBoard> createState() => _LoginDashBoardState();
}

class _LoginDashBoardState extends State<LoginDashBoard> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? category;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _onTabChanged();
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    int index = _tabController.index;
    switch (index) {
      case 0:
        category = AuthHelper.student;
        break;
      case 1:
        category = AuthHelper.faculty;
        break;
      case 2:
        category = AuthHelper.admin;
        break;
      default:
        category = AuthHelper.student;
    }

    context.read<AuthCubit>().selectedCategory(category: category!);
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        bottom: TabBar(
          onTap: (value) {
            _onTabChanged();
          },
          controller: _tabController,
          unselectedLabelStyle: GoogleFonts.poppins(fontSize: 15, color: Colors.grey),
          labelStyle: GoogleFonts.poppins(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
          tabs: const [
            Tab(text: 'Student'),
            Tab(text: 'Faculty'),
            Tab(text: 'Admin'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          LoginScreen(lable: "Student"),
          LoginScreen(lable: "Faculty"),
          LoginScreen(lable: "Admin"),
        ],
      ),
    );
  }
}
