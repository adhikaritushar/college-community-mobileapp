part of 'faculty_cubit.dart';

@freezed
class FacultyState with _$FacultyState {
  const factory FacultyState({
    @Default(false) bool isLoadingState,
    @Default(false) bool isSuccessState,
    AppErrorHandler? errorState,
    @Default("") String genderSelect,
    @Default([]) List<FacultyEntity> facultydata,
    FacultyRegisterEntity? registerResponse,
  }) = _FacultyState;

  factory FacultyState.initially() => const FacultyState();
}
