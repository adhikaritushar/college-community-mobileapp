import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/notice/domain/entities/notice_entity.dart';
import 'package:college_community/features/notice/domain/repository/notice_repository.dart';

class GetNoticeUsecase extends UseCase<List<NoticeEntity>, void> {
  final NoticeRepository repository;

  GetNoticeUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, List<NoticeEntity>>> call(void parms) async {
    return await repository.getNotice();
  }
}
