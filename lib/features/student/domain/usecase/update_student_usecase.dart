import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/student/domain/entity/reqeust/student_add_details_faculty_params.dart';
import 'package:college_community/features/student/domain/repository/student_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateStudentUsecase extends UseCase<String, StudentAddDetailParams> {
  final StudentRepository repository;

  UpdateStudentUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, String>> call(StudentAddDetailParams parms) async {
    return repository.updateStudent(params: parms);
  }
}
