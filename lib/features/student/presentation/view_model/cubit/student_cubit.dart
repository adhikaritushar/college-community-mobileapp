// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:college_community/core/common_widgets/k_snack_bar.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:college_community/features/student/domain/entity/reqeust/student_add_details_faculty_params.dart';
import 'package:college_community/features/student/domain/entity/student_entity.dart';
import 'package:college_community/features/student/domain/usecase/register_student_usecase.dart';
import 'package:college_community/features/student/domain/usecase/student_add_detail_usecase.dart';
import 'package:college_community/features/student/domain/usecase/student_get_detail_usecase.dart';
import 'package:college_community/features/student/domain/usecase/update_student_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_cubit.freezed.dart';
part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  final StudentGetDetailUsecase studentGetDetailUsecase;
  final RegisterStudentUsecase registerStudentUsecase;
  final StudentAddDetailUsecase studentAddDetailUsecase;
  final UpdateStudentUsecase updateStudentUsecase;

  StudentCubit({
    required this.studentGetDetailUsecase,
    required this.registerStudentUsecase,
    required this.studentAddDetailUsecase,
    required this.updateStudentUsecase,
  }) : super(StudentState.initially());

//* ================================= STUDENT GET DETAILS ================================
  void studentGetDetials({required StudentGetDetilsParams params, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));

    final result = await studentGetDetailUsecase.call(params);

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
          studentData: success,
        ));
      },
    );
  }

  void studentAddDetials({required StudentAddDetailParams params, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));

    final result = await studentAddDetailUsecase.call(params);

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

        registerStudent(
          params: LoginParams(loginID: success.enrollmentNo.toString(), password: success.enrollmentNo.toString()),
          context: context,
        );
      },
    );
  }

  void registerStudent({required LoginParams params, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));

    final result = await registerStudentUsecase.call(params);

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

  void updateStudent({required StudentAddDetailParams params, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));

    final result = await updateStudentUsecase.call(params);

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
