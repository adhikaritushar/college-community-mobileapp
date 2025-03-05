part of 'material_cubit.dart';

@freezed
class MaterialsState with _$MaterialsState {
  const factory MaterialsState({
    @Default(false) bool isLoadingState,
    @Default(false) bool isSuccessState,
    AppErrorHandler? errorState,
    @Default([]) List<MaterialEntity> materialList,
  }) = _MaterialsState;

  factory MaterialsState.initially() => const MaterialsState();
}
