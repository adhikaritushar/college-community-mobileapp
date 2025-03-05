part of 'timetable_cubit.dart';

@freezed
class TimetableState with _$TimetableState {
  const factory TimetableState({
    @Default(false) bool isLoadingState,
    @Default(false) bool isSuccessState,
    AppErrorHandler? errorState,
    @Default([]) List<TimetableEntity> timetableList,
  }) = _SubjectState;

  factory TimetableState.initially() => const TimetableState();
}
