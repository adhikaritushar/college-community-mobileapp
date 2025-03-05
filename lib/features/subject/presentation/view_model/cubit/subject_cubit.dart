// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:college_community/core/common_widgets/k_snack_bar.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/subject/domain/entity/request/add_subject_parms.dart';
import 'package:college_community/features/subject/domain/entity/subject_entity.dart';
import 'package:college_community/features/subject/domain/usecase/add_subject_usecase.dart';
import 'package:college_community/features/subject/domain/usecase/delete_subject_usecase.dart';
import 'package:college_community/features/subject/domain/usecase/get_subject_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_cubit.freezed.dart';
part 'subject_state.dart';

class SubjectCubit extends Cubit<SubjectState> {
  final GetSubjectUsecase getSubjectUsecase;
  final AddSubjectUsecase addSubjectUsecase;
  final DeleteSubjectUsecase deleteSubjectUsecase;

  SubjectCubit({
    required this.getSubjectUsecase,
    required this.addSubjectUsecase,
    required this.deleteSubjectUsecase,
  }) : super(SubjectState.initially());

  void getSubject() async {
    emit(state.copyWith(isLoadingState: true));
    final result = await getSubjectUsecase.call(null);

    result.fold(
      (l) {
        emit(state.copyWith(
          errorState: AppErrorHandler(message: l.message),
          isLoadingState: false,
        ));
      },
      (r) {
        emit(state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
          subjectList: r,
        ));
      },
    );
  }

  void addSubject({required AddSubjectParms params, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));
    final result = await addSubjectUsecase.call(params);

    result.fold(
      (l) {
        kShowSnackBar(context, message: l.message, backgroundColor: Colors.red);

        emit(state.copyWith(
          errorState: AppErrorHandler(message: l.message),
          isLoadingState: false,
        ));
      },
      (r) {
        kShowSnackBar(context, message: r, backgroundColor: Colors.green);

        emit(state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
        ));
      },
    );
  }

  void deleteSubject({required String id, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));
    final result = await deleteSubjectUsecase.call(id);

    result.fold(
      (l) {
        kShowSnackBar(context, message: l.message, backgroundColor: Colors.red);

        emit(state.copyWith(
          errorState: AppErrorHandler(message: l.message),
          isLoadingState: false,
        ));
      },
      (r) {
        kShowSnackBar(context, message: r, backgroundColor: Colors.green);
        getSubject();
        emit(state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
        ));
      },
    );
  }
}
