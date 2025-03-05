import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/faculty/domain/entity/faculty_entity.dart';
import 'package:college_community/features/faculty/domain/entity/reqeust/faculty_add_update_params.dart';
import 'package:college_community/features/faculty/domain/repository/faculty_repository.dart';
import 'package:dartz/dartz.dart';

class FacultyAddDetailUsecase extends UseCase<FacultyEntity, FacultyAddUpdateParams> {
  final FacultyRepository repository;

  FacultyAddDetailUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, FacultyEntity>> call(FacultyAddUpdateParams parms) async {
    return repository.addfacultyDetail(params: parms);
  }
}
