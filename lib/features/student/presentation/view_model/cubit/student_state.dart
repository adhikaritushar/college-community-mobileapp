part of 'student_cubit.dart';

@freezed
class StudentState with _$StudentState {
  const factory StudentState({
    @Default(false) bool isLoadingState,
    @Default(false) bool isSuccessState,
    AppErrorHandler? errorState,
    @Default("") String genderSelect,
    @Default([]) List<StudentEntity> studentData,
  }) = _StudentState;

  factory StudentState.initially() => const StudentState();
}
