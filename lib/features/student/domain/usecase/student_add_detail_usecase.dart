import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/student/domain/entity/reqeust/student_add_details_faculty_params.dart';
import 'package:college_community/features/student/domain/entity/student_entity.dart';
import 'package:college_community/features/student/domain/repository/student_repository.dart';
import 'package:dartz/dartz.dart';

class StudentAddDetailUsecase extends UseCase<StudentEntity, StudentAddDetailParams> {
  final StudentRepository repository;

  StudentAddDetailUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, StudentEntity>> call(StudentAddDetailParams parms) async {
    return repository.studentAddDetail(params: parms);
  }
}
