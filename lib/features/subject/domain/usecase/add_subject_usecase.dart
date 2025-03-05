import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/subject/domain/entity/request/add_subject_parms.dart';
import 'package:college_community/features/subject/domain/repository/subject_repository.dart';
import 'package:dartz/dartz.dart';

class AddSubjectUsecase extends UseCase<String, AddSubjectParms> {
  final SubjectRepository repository;

  AddSubjectUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, String>> call(AddSubjectParms parms) async {
    return repository.addSubject(params: parms);
  }
}
