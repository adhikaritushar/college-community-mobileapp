import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/faculty/domain/entity/faculty_entity.dart';
import 'package:college_community/features/faculty/domain/repository/faculty_repository.dart';
import 'package:dartz/dartz.dart';

class FacultyGetUsecase extends UseCase<List<FacultyEntity>, String> {
  final FacultyRepository repository;

  FacultyGetUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, List<FacultyEntity>>> call(String parms) async {
    return repository.getFaculty(employeeId: parms);
  }
}
