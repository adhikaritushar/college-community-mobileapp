part of 'admin_dashboard_cubit.dart';

@freezed
class AdminDashboardState with _$AdminDashboardState {
  const factory AdminDashboardState({
    @Default(false) bool isLoadingState,
    @Default(false) bool isSuccessState,
    AppErrorHandler? errorState,
    @Default([]) List<FacultyUserEntity> userData,
  }) = _AdminDashboardState;

  factory AdminDashboardState.initially() => const AdminDashboardState();
}
