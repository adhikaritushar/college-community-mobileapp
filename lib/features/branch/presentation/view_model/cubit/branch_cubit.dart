// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:college_community/core/common_widgets/k_snack_bar.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/branch/domain/entity/branch_entity.dart';
import 'package:college_community/features/branch/domain/usecase/add_branch_usecase.dart';
import 'package:college_community/features/branch/domain/usecase/delete_branch_usecase.dart';
import 'package:college_community/features/branch/domain/usecase/get_branch_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_cubit.freezed.dart';
part 'branch_state.dart';

class BranchCubit extends Cubit<BranchState> {
  final GetBranchUsecase getBranchUsecase;
  final AddBranchUsecase addBranchUsecase;
  final DeleteBranchUsecase deleteBranchUsecase;
  BranchCubit({
    required this.getBranchUsecase,
    required this.addBranchUsecase,
    required this.deleteBranchUsecase,
  }) : super(BranchState.initially());

  void getBranch() async {
    emit(state.copyWith(isLoadingState: true));
    final result = await getBranchUsecase.call(null);

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
          branchList: r,
        ));
      },
    );
  }

  void addBranch({required String branchName, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));
    final result = await addBranchUsecase.call(branchName);

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

  void deleteBranch({required String id, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));
    final result = await deleteBranchUsecase.call(id);

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
        getBranch();
        emit(state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
        ));
      },
    );
  }
}
