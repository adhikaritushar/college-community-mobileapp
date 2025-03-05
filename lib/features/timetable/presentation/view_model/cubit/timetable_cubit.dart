// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:college_community/core/common_widgets/k_snack_bar.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/faculty_dashboard_screen.dart';
import 'package:college_community/features/timetable/domain/entity/request/post_timetable_params.dart';
import 'package:college_community/features/timetable/domain/entity/time_table_entity.dart';
import 'package:college_community/features/timetable/domain/usecase/get_timetable_usecase.dart';
import 'package:college_community/features/timetable/domain/usecase/post_timetable_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timetable_cubit.freezed.dart';
part 'timetable_state.dart';

class TimetableCubit extends Cubit<TimetableState> {
  final GetTimeTableUsecase getTimeTableUsecase;
  final PostTimetableUsecase postTimetableUsecase;

  TimetableCubit({
    required this.getTimeTableUsecase,
    required this.postTimetableUsecase,
  }) : super(TimetableState.initially());

  void postTimetable({required PostTimetableParams params, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));
    final result = await postTimetableUsecase.call(params);

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
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FacultyDashboardScreen()));

        emit(state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
        ));
      },
    );
  }

  void getTimetable() async {
    emit(state.copyWith(isLoadingState: true));
    final result = await getTimeTableUsecase.call(null);

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
          timetableList: r,
        ));
      },
    );
  }
}
