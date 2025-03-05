part of 'marks_cubit.dart';

@freezed
class MarksState with _$MarksState {
  const factory MarksState({
    @Default(false) bool isLoadingState,
    @Default(false) bool isSuccessState,
    AppErrorHandler? errorState,
    @Default([]) List<MarksEntity> marksList,
  }) = _MarksState;

  factory MarksState.initially() => const MarksState();
}
