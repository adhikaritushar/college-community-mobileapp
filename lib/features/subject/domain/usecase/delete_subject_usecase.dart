import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/subject/domain/repository/subject_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteSubjectUsecase extends UseCase<String, String> {
  final SubjectRepository repository;

  DeleteSubjectUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, String>> call(String parms) async {
    return repository.deleteSubject(id: parms);
  }
}
