// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:college_community/core/common_widgets/k_snack_bar.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/material/domain/entity/material_entity.dart';
import 'package:college_community/features/material/domain/entity/request/add_material_params.dart';
import 'package:college_community/features/material/domain/usecase/add_material_usecase.dart';
import 'package:college_community/features/material/domain/usecase/get_material_usecase.dart';

part 'material_cubit.freezed.dart';
part 'material_state.dart';

class MaterialsCubit extends Cubit<MaterialsState> {
  final GetMaterialUsecase getMaterialUsecase;
  final AddMaterialUsecase addMaterialUsecase;
  MaterialsCubit({
    required this.getMaterialUsecase,
    required this.addMaterialUsecase,
  }) : super(MaterialsState.initially());

  void getMaterial(BuildContext context, {required String subject}) async {
    emit(state.copyWith(isLoadingState: true));
    final result = await getMaterialUsecase.call(subject);

    result.fold(
      (l) {
        emit(state.copyWith(
          errorState: AppErrorHandler(message: l.message),
          isLoadingState: false,
        ));
      },
      (r) {
        emit(state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
          materialList: r,
        ));
      },
    );
  }

  void addMaterial(BuildContext context, {required AddMaterialParams params}) async {
    emit(state.copyWith(isLoadingState: true));
    final result = await addMaterialUsecase.call(params);

    result.fold(
      (l) {
        kShowSnackBar(context, message: l.message, backgroundColor: Colors.red);

        emit(state.copyWith(
          errorState: AppErrorHandler(message: l.message),
          isLoadingState: false,
        ));
      },
      (r) {
        kShowSnackBar(context, message: r, backgroundColor: Colors.green);
        emit(state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
        ));
      },
    );
  }
}
