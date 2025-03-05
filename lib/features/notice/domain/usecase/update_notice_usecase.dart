import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/notice/domain/entities/request/notice_add_update_params.dart';
import 'package:college_community/features/notice/domain/repository/notice_repository.dart';

class UpdateNoticeUsecase extends UseCase<String, NoticeAddUpdateParams> {
  final NoticeRepository repository;

  UpdateNoticeUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, String>> call(NoticeAddUpdateParams parms) async {
    return await repository.updateNotice(params: parms);
  }
}
