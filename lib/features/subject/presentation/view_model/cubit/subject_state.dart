part of 'subject_cubit.dart';

@freezed
class SubjectState with _$SubjectState {
  const factory SubjectState({
    @Default(false) bool isLoadingState,
    @Default(false) bool isSuccessState,
    AppErrorHandler? errorState,
    @Default([]) List<SubjectEntity> subjectList,
  }) = _SubjectState;

  factory SubjectState.initially() => const SubjectState();
}
