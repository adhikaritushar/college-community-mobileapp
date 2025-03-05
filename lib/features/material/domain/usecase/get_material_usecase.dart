import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/material/domain/entity/material_entity.dart';
import 'package:college_community/features/material/domain/repository/material_repository.dart';

class GetMaterialUsecase extends UseCase<List<MaterialEntity>, String> {
  final MaterialRepository repository;

  GetMaterialUsecase({required this.repository});

  @override
  Future<Either<AppErrorHandler, List<MaterialEntity>>> call(String parms) async {
    return await repository.getMaterial(subject: parms);
  }
}
