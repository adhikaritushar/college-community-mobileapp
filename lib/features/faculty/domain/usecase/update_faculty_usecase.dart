import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/faculty/domain/entity/reqeust/faculty_add_update_params.dart';
import 'package:college_community/features/faculty/domain/repository/faculty_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateFacultyUsecase extends UseCase<String, FacultyAddUpdateParams> {
  final FacultyRepository repository;

  UpdateFacultyUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, String>> call(FacultyAddUpdateParams parms) async {
    return repository.updatefaculty(params: parms);
  }
}
