import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/subject/domain/entity/subject_entity.dart';
import 'package:college_community/features/subject/domain/repository/subject_repository.dart';

class GetSubjectUsecase extends UseCase<List<SubjectEntity>, void> {
  final SubjectRepository repository;

  GetSubjectUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, List<SubjectEntity>>> call(void parms) async {
    return repository.getSubject();
  }
}
