// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:college_community/core/common_widgets/k_snack_bar.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/auth/data/datasource/local_datasource/auth_local_datasource.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:college_community/features/auth/domain/entities/response/login_response_entity.dart';
import 'package:college_community/features/auth/domain/usecase/admin_change_password_usecase.dart';
import 'package:college_community/features/auth/domain/usecase/admin_login_usecase.dart';
import 'package:college_community/features/auth/domain/usecase/faculty_change_password_usecase.dart';
import 'package:college_community/features/auth/domain/usecase/faculty_login_usecase.dart';
import 'package:college_community/features/auth/domain/usecase/student_change_password_usecase.dart';
import 'package:college_community/features/auth/domain/usecase/student_login_usecase.dart';
import 'package:college_community/features/auth/presentation/helpers/auth_helper.dart';
import 'package:college_community/features/auth/presentation/view/login_dashboard_screen.dart';
import 'package:college_community/features/dashboards/admin_dashboard/presentation/view/admin_dashboard_screen.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/faculty_dashboard_screen.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view_model/cubit/faculty_dashboard_cubit.dart';
import 'package:college_community/features/dashboards/student_dashboard/presentation/view/student_dashboard_screen.dart';
import 'package:college_community/features/marks/presentation/view_model.dart/cubit/marks_cubit.dart';
import 'package:college_community/features/student/domain/entity/reqeust/student_add_details_faculty_params.dart';
import 'package:college_community/features/student/presentation/view_model/cubit/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AdminLoginUsecase adminLoginUsecase;
  final StudentLoginUsecase studentLoginUsecase;
  final FacultyLoginUsecase facultyLoginUsecase;
  final AdminChangePasswordUsecase adminChangePasswordUsecase;
  final FacultyChangePasswordUsecase facultyChangePasswordUsecase;
  final StudentChangePasswordUsecase studentChangePasswordUsecase;

  AuthCubit({
    required this.adminLoginUsecase,
    required this.studentLoginUsecase,
    required this.facultyLoginUsecase,
    required this.adminChangePasswordUsecase,
    required this.facultyChangePasswordUsecase,
    required this.studentChangePasswordUsecase,
  }) : super(AuthState.initially());

  void selectedCategory({required String category}) {
    if (state.selectedCategory != category) {
      emit(state.copyWith(selectedCategory: category));
    }
  }

  loginDashBoard({
    required String loginID,
    required String password,
    required BuildContext context,
  }) async {
    if (state.selectedCategory == AuthHelper.admin) {
      await AuthLoginCheckService.setAuthLoginCheck(userRole: UserRole.admin);
      adminLogin(loginID: loginID, password: password, context: context);
    } else if (state.selectedCategory == AuthHelper.faculty) {
      await AuthLoginCheckService.setAuthLoginCheck(userRole: UserRole.faculty);
      facultyLogin(loginID: loginID, password: password, context: context);
    } else if (state.selectedCategory == AuthHelper.student) {
      await AuthLoginCheckService.setAuthLoginCheck(userRole: UserRole.student);
      studentLogin(loginID: loginID, password: password, context: context);
    } else {
      throw UnimplementedError('Unknown category selected');
    }
  }

  void adminLogin({required String loginID, required String password, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));

    final result = await adminLoginUsecase.call(LoginParams(loginID: loginID, password: password));
    result.fold(
      (error) {
        kShowSnackBar(context, message: error.message, backgroundColor: Colors.red);

        emit(state.copyWith(
          errorState: AppErrorHandler(message: error.message),
          isLoadingState: false,
        ));
      },
      (success) {
        kShowSnackBar(context, message: success.message!, backgroundColor: Colors.green);

        emit(state.copyWith(
          loginResponse: success,
          isLoadingState: false,
          isSuccessState: true,
        ));

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AdminDashboardScreen()),
          (route) => false,
        );
      },
    );
  }

  void studentLogin({required String loginID, required String password, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));

    final result = await studentLoginUsecase.call(LoginParams(loginID: loginID, password: password));
    result.fold(
      (error) {
        kShowSnackBar(context, message: error.message, backgroundColor: Colors.red);
        emit(state.copyWith(
          errorState: AppErrorHandler(message: error.message),
          isLoadingState: false,
        ));
      },
      (success) {
        kShowSnackBar(context, message: success.message!, backgroundColor: Colors.green);
        context.read<StudentCubit>().studentGetDetials(params: StudentGetDetilsParams(enrollmentNo: success.loginid!), context: context);

        context.read<MarksCubit>().getMarks(enrollmentNo: success.loginid!);

        emit(state.copyWith(
          loginResponse: success,
          isLoadingState: false,
          isSuccessState: true,
        ));

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const StudentDashboardScreen()),
          (route) => false,
        );
      },
    );
  }

  void facultyLogin({required String loginID, required String password, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));

    final result = await facultyLoginUsecase.call(LoginParams(loginID: loginID, password: password));
    result.fold(
      (error) {
        kShowSnackBar(context, message: error.message, backgroundColor: Colors.red);
        emit(state.copyWith(
          errorState: AppErrorHandler(message: error.message),
          isLoadingState: false,
        ));
      },
      (success) {
        context.read<FacultyDashboardCubit>().getUserDetials(enrollmentNo: success.loginid!);
        kShowSnackBar(context, message: success.message!, backgroundColor: Colors.green);

        emit(state.copyWith(
          loginResponse: success,
          isLoadingState: false,
          isSuccessState: true,
        ));

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const FacultyDashboardScreen()),
          (route) => false,
        );
      },
    );
  }

  void adminChangePassword({required LoginParams changePasswrod, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));

    final result = await adminChangePasswordUsecase.call(changePasswrod);
    result.fold(
      (error) {
        kShowSnackBar(context, message: error.message, backgroundColor: Colors.red);
        emit(state.copyWith(
          errorState: AppErrorHandler(message: error.message),
          isLoadingState: false,
        ));
      },
      (success) {
        kShowSnackBar(context, message: success, backgroundColor: Colors.green);

        emit(state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
        ));

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginDashBoard()),
          (route) => false,
        );
      },
    );
  }

  void facultyChangePassword({required LoginParams changePasswrod, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));

    final result = await facultyChangePasswordUsecase.call(changePasswrod);
    result.fold(
      (error) {
        kShowSnackBar(context, message: error.message, backgroundColor: Colors.red);
        emit(state.copyWith(
          errorState: AppErrorHandler(message: error.message),
          isLoadingState: false,
        ));
      },
      (success) {
        kShowSnackBar(context, message: success, backgroundColor: Colors.green);

        emit(state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
        ));

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginDashBoard()),
          (route) => false,
        );
      },
    );
  }

  void studentChangePassword({required LoginParams changePasswrod, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));

    final result = await studentChangePasswordUsecase.call(changePasswrod);
    result.fold(
      (error) {
        kShowSnackBar(context, message: error.message, backgroundColor: Colors.red);
        emit(state.copyWith(
          errorState: AppErrorHandler(message: error.message),
          isLoadingState: false,
        ));
      },
      (success) {
        kShowSnackBar(context, message: success, backgroundColor: Colors.green);

        emit(state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
        ));

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginDashBoard()),
          (route) => false,
        );
      },
    );
  }
}
