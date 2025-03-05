// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:college_community/core/common_widgets/k_snack_bar.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/admin/domain/entities/request/admin_add_detail_params.dart';
import 'package:college_community/features/admin/domain/entities/response/admin_entity.dart';
import 'package:college_community/features/admin/domain/usecase/admin_add_detail_usecase.dart';
import 'package:college_community/features/admin/domain/usecase/admin_get_detail_usecase.dart';
import 'package:college_community/features/admin/domain/usecase/admin_register_usecase.dart';
import 'package:college_community/features/admin/domain/usecase/admin_update_details_usecase.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_cubit.freezed.dart';
part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  final AdminAddDetailUsecase adminAddDetailUsecase;
  final AdminGetDetailUsecase adminGetDetailUsecase;
  final AdminRegisterUsecase adminRegisterUsecase;
  final AdminUpdateDetailsUsecase adminUpdateDetailsUsecase;

  AdminCubit({
    required this.adminAddDetailUsecase,
    required this.adminGetDetailUsecase,
    required this.adminRegisterUsecase,
    required this.adminUpdateDetailsUsecase,
  }) : super(AdminState.initially());

//* ================================= STUDENT GET DETAILS ================================
  void adminGetDetials({required String employeeId, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));

    final result = await adminGetDetailUsecase.call(employeeId);

    result.fold(
      (error) {
        emit(state.copyWith(
          errorState: AppErrorHandler(message: error.message),
          isLoadingState: false,
        ));
      },
      (success) async {
        if (success.isEmpty) {
          kShowSnackBar(context, message: "Student Not Found!!", backgroundColor: Colors.red);
        }
        emit(state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
          adminData: success,
        ));
      },
    );
  }

  void adminAddDetials({required AdminAddDetailParams params, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));

    final result = await adminAddDetailUsecase.call(params);

    result.fold(
      (error) {
        emit(state.copyWith(
          errorState: AppErrorHandler(message: error.message),
          isLoadingState: false,
        ));
      },
      (success) async {
        emit(state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
        ));

        registerAdmin(
          params: LoginParams(loginID: success.employeeId.toString(), password: success.employeeId.toString()),
          context: context,
        );
      },
    );
  }

  void registerAdmin({required LoginParams params, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));

    final result = await adminRegisterUsecase.call(params);

    result.fold(
      (error) {
        kShowSnackBar(context, message: error.message, backgroundColor: Colors.red);

        emit(state.copyWith(
          errorState: AppErrorHandler(message: error.message),
          isLoadingState: false,
        ));
      },
      (success) async {
        kShowSnackBar(context, message: success, backgroundColor: Colors.green);
        Navigator.pop(context);
        emit(state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
        ));
      },
    );
  }

  void updateAdmin({required AdminAddDetailParams params, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));

    final result = await adminUpdateDetailsUsecase.call(params);

    result.fold(
      (error) {
        kShowSnackBar(context, message: error.message, backgroundColor: Colors.red);

        emit(state.copyWith(
          errorState: AppErrorHandler(message: error.message),
          isLoadingState: false,
        ));
      },
      (success) async {
        kShowSnackBar(context, message: success, backgroundColor: Colors.green);
        Navigator.pop(context);

        emit(state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
        ));
      },
    );
  }
}
