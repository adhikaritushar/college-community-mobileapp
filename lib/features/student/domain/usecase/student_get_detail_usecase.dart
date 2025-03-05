import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/student/domain/entity/reqeust/student_add_details_faculty_params.dart';
import 'package:college_community/features/student/domain/entity/student_entity.dart';
import 'package:college_community/features/student/domain/repository/student_repository.dart';

class StudentGetDetailUsecase extends UseCase<List<StudentEntity>, StudentGetDetilsParams> {
  final StudentRepository repository;

  StudentGetDetailUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, List<StudentEntity>>> call(StudentGetDetilsParams parms) async {
    return repository.studentGetDetail(params: parms);
  }
}
