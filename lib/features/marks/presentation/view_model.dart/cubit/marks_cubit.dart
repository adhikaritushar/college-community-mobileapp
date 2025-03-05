// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:college_community/core/common_widgets/k_snack_bar.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/marks/domain/entity/marks_entity.dart';
import 'package:college_community/features/marks/domain/entity/request/add_marks_params.dart';
import 'package:college_community/features/marks/domain/usecase/add_marks_usecase.dart';
import 'package:college_community/features/marks/domain/usecase/get_marks_usecase.dart';

part 'marks_cubit.freezed.dart';
part 'marks_state.dart';

class MarksCubit extends Cubit<MarksState> {
  final GetMarksUsecase getMarksUsecase;
  final AddMarksUsecase addMarksUsecase;
  MarksCubit({
    required this.getMarksUsecase,
    required this.addMarksUsecase,
  }) : super(MarksState.initially());

  void getMarks({required int enrollmentNo}) async {
    emit(state.copyWith(isLoadingState: true));
    final result = await getMarksUsecase.call(enrollmentNo);

    result.fold(
      (l) {
        emit(state.copyWith(
          errorState: AppErrorHandler(message: l.message),
          isLoadingState: false,
        ));
      },
      (r) {
        log("Allmarkd ::$r");
        emit(state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
          marksList: r,
        ));
      },
    );
  }

  void addMarks(BuildContext context, {required AddMarksParams params}) async {
    emit(state.copyWith(isLoadingState: true));
    final result = await addMarksUsecase.call(params);

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
}
