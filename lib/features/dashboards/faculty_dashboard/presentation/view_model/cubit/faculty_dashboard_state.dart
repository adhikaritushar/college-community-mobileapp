part of 'faculty_dashboard_cubit.dart';

@freezed
class FacultyDashboardState with _$FacultyDashboardState {
  const factory FacultyDashboardState({
    @Default(false) bool isLoadingState,
    @Default(false) bool isSuccessState,
    AppErrorHandler? errorState,
    @Default([]) List<FacultyUserEntity> userData,
  }) = _FacultyDashboardState;

  factory FacultyDashboardState.initially() => const FacultyDashboardState();
}
