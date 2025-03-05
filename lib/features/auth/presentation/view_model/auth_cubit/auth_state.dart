part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoadingState,
    @Default(false) bool isSuccessState,
    AppErrorHandler? errorState,
    @Default("Student") String selectedCategory,
    LoginResponseEntity? loginResponse,
  }) = _AuthState;

  factory AuthState.initially() => const AuthState();
}
