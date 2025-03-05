import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/marks/domain/entity/request/add_marks_params.dart';
import 'package:college_community/features/marks/domain/repository/marks_repository.dart';

class AddMarksUsecase extends UseCase<String, AddMarksParams> {
  final MarksRepository repository;

  AddMarksUsecase({required this.repository});

  @override
  Future<Either<AppErrorHandler, String>> call(AddMarksParams parms) async {
    return await repository.addMarks(params: parms);
  }
}
