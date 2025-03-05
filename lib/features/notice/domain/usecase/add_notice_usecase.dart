import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/notice/domain/entities/request/notice_add_update_params.dart';
import 'package:college_community/features/notice/domain/repository/notice_repository.dart';

class AddNoticeUsecase extends UseCase<String, NoticeAddUpdateParams> {
  final NoticeRepository repository;

  AddNoticeUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, String>> call(NoticeAddUpdateParams parms) async {
    return await repository.addNotice(params: parms);
  }
}
