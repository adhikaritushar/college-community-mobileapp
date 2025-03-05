import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/notice/domain/repository/notice_repository.dart';

class DeleteNoticeUsecase extends UseCase<String, String> {
  final NoticeRepository repository;

  DeleteNoticeUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, String>> call(String parms) async {
    return await repository.deleteNotice(id: parms);
  }
}
