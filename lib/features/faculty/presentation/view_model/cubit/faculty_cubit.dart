// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:college_community/core/common_widgets/k_snack_bar.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:college_community/features/faculty/domain/entity/faculty_entity.dart';
import 'package:college_community/features/faculty/domain/entity/faculty_register_response.dart';
import 'package:college_community/features/faculty/domain/entity/reqeust/faculty_add_update_params.dart';
import 'package:college_community/features/faculty/domain/usecase/faculty_add_detail_usecase.dart';
import 'package:college_community/features/faculty/domain/usecase/faculty_get_usecase.dart';
import 'package:college_community/features/faculty/domain/usecase/register_faculty_usecase.dart';
import 'package:college_community/features/faculty/domain/usecase/update_faculty_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'faculty_cubit.freezed.dart';
part 'faculty_state.dart';

class FacultyCubit extends Cubit<FacultyState> {
  final FacultyAddDetailUsecase facultyAddDetailUsecase;
  final FacultyGetUsecase facultyGetUsecase;
  final RegisterFacultyUsecase registerFacultyUsecase;
  final UpdateFacultyUsecase updateFacultyUsecase;

  FacultyCubit({
    required this.facultyAddDetailUsecase,
    required this.facultyGetUsecase,
    required this.registerFacultyUsecase,
    required this.updateFacultyUsecase,
  }) : super(FacultyState.initially());

  void getFaculty({required String employeeId}) async {
    emit(state.copyWith(isLoadingState: true));

    final result = await facultyGetUsecase.call(employeeId);

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
          facultydata: success,
        ));
      },
    );
  }

  void addfaculty({required FacultyAddUpdateParams params, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));

    final result = await facultyAddDetailUsecase.call(params);
    result.fold(
      (error) {
        kShowSnackBar(context, message: error.message, backgroundColor: Colors.red);

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

        registerFaculty(
          params: LoginParams(loginID: success.employeeId.toString(), password: success.employeeId.toString()),
          context: context,
        );
      },
    );
  }

  void registerFaculty({required LoginParams params, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));

    final result = await registerFacultyUsecase.call(params);

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

  void updateFaculty({required FacultyAddUpdateParams params, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));

    final result = await updateFacultyUsecase.call(params);
    log("messageupda ::$result");

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
