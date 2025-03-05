import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/domain/entity/faculty_user_entity.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/domain/usecase/faculty_get_user_detail_usecase.dart';

part 'faculty_dashboard_cubit.freezed.dart';
part 'faculty_dashboard_state.dart';

class FacultyDashboardCubit extends Cubit<FacultyDashboardState> {
  final FacultyGetUserDetailUsecase facultyGetUserDetailUsecase;
  FacultyDashboardCubit({
    required this.facultyGetUserDetailUsecase,
  }) : super(FacultyDashboardState.initially());

  void getUserDetials({required int enrollmentNo}) async {
    emit(state.copyWith(isLoadingState: true));
    final result = await facultyGetUserDetailUsecase.call(enrollmentNo);

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
          userData: r,
        ));
      },
    );
  }
}
