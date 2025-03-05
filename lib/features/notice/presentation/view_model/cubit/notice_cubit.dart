// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:college_community/core/common_widgets/k_snack_bar.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/notice/domain/entities/notice_entity.dart';
import 'package:college_community/features/notice/domain/entities/request/notice_add_update_params.dart';
import 'package:college_community/features/notice/domain/usecase/add_notice_usecase.dart';
import 'package:college_community/features/notice/domain/usecase/delete_notice_usecase.dart';
import 'package:college_community/features/notice/domain/usecase/get_notice_usecase.dart';
import 'package:college_community/features/notice/domain/usecase/update_notice_usecase.dart';

part 'notice_cubit.freezed.dart';
part 'notice_state.dart';

class NoticeCubit extends Cubit<NoticeState> {
  final GetNoticeUsecase getNoticeUsecase;
  final AddNoticeUsecase addNoticeUsecase;
  final UpdateNoticeUsecase updateNoticeUsecase;
  final DeleteNoticeUsecase deleteNoticeUsecase;

  NoticeCubit({
    required this.getNoticeUsecase,
    required this.addNoticeUsecase,
    required this.updateNoticeUsecase,
    required this.deleteNoticeUsecase,
  }) : super(NoticeState.initially());

  void getNotice(BuildContext context) async {
    emit(state.copyWith(isLoadingState: true));
    final result = await getNoticeUsecase.call(null);

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
          noteList: r,
        ));
      },
    );
  }

  void addNotice({required NoticeAddUpdateParams params, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));
    final result = await addNoticeUsecase.call(params);

    result.fold(
      (l) {
        kShowSnackBar(context, message: l.message, backgroundColor: Colors.red);

        emit(state.copyWith(
          errorState: AppErrorHandler(message: l.message),
          isLoadingState: false,
        ));
      },
      (r) {
        getNotice(context);
        kShowSnackBar(context, message: r, backgroundColor: Colors.green);
        Navigator.pop(context);
        emit(state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
        ));
      },
    );
  }

  void updateNotice({required NoticeAddUpdateParams params, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));
    final result = await updateNoticeUsecase.call(params);

    result.fold(
      (l) {
        kShowSnackBar(context, message: l.message, backgroundColor: Colors.red);

        emit(state.copyWith(
          errorState: AppErrorHandler(message: l.message),
          isLoadingState: false,
        ));
      },
      (r) {
        getNotice(context);
        Navigator.pop(context);
        kShowSnackBar(context, message: r, backgroundColor: Colors.green);

        emit(state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
        ));
      },
    );
  }

  void deleteNotice({required String id, required BuildContext context}) async {
    emit(state.copyWith(isLoadingState: true));
    final result = await deleteNoticeUsecase.call(id);

    result.fold(
      (l) {
        kShowSnackBar(context, message: l.message, backgroundColor: Colors.red);

        emit(state.copyWith(
          errorState: AppErrorHandler(message: l.message),
          isLoadingState: false,
        ));
      },
      (r) {
        getNotice(context);
        kShowSnackBar(context, message: r, backgroundColor: Colors.green);

        emit(state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
        ));
      },
    );
  }
}
