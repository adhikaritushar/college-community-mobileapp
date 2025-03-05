// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/dashboards/admin_dashboard/domain/usecase/admin_dashboard_get_user_detail_usecase.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/domain/entity/faculty_user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_dashboard_cubit.freezed.dart';
part 'admin_dashboard_state.dart';

class AdminDashboardCubit extends Cubit<AdminDashboardState> {
  final AdminDashboardGetUserDetailUsecase adminDashboardGetUserDetailUsecase;
  AdminDashboardCubit({
    required this.adminDashboardGetUserDetailUsecase,
  }) : super(AdminDashboardState.initially());

  void adminDashboardProfile({required int employeeId}) async {
    emit(state.copyWith(isLoadingState: true));
    final result = await adminDashboardGetUserDetailUsecase.call(employeeId);

    result.fold(
      (l) {
        emit(state.copyWith(
          errorState: AppErrorHandler(message: l.message),
          isLoadingState: false,
        ));
      },
      (r) {
        log("adminpro ::$r");
        emit(state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
          userData: r,
        ));
      },
    );
  }
}
