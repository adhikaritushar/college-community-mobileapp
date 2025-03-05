part of 'admin_cubit.dart';

@freezed
class AdminState with _$AdminState {
  const factory AdminState({
    @Default(false) bool isLoadingState,
    @Default(false) bool isSuccessState,
    AppErrorHandler? errorState,
    @Default("") String genderSelect,
    @Default([]) List<AdminEntity>? adminData,
  }) = _AdminState;

  factory AdminState.initially() => const AdminState();
}
