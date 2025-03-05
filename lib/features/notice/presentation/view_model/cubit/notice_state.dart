part of 'notice_cubit.dart';

@freezed
class NoticeState with _$NoticeState {
  const factory NoticeState({
    @Default(false) bool isLoadingState,
    @Default(false) bool isSuccessState,
    AppErrorHandler? errorState,
    @Default([]) List<NoticeEntity> noteList,
  }) = _NoticeState;

  factory NoticeState.initially() => const NoticeState();
}
