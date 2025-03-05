part of 'branch_cubit.dart';

@freezed
class BranchState with _$BranchState {
  const factory BranchState({
    @Default(false) bool isLoadingState,
    @Default(false) bool isSuccessState,
    AppErrorHandler? errorState,
    @Default([]) List<BranchEntity> branchList,
  }) = _BranchState;

  factory BranchState.initially() => const BranchState();
}
