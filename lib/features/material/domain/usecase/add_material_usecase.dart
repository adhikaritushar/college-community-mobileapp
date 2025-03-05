import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/material/domain/entity/request/add_material_params.dart';
import 'package:college_community/features/material/domain/repository/material_repository.dart';

class AddMaterialUsecase extends UseCase<String, AddMaterialParams> {
  final MaterialRepository repository;

  AddMaterialUsecase({required this.repository});

  @override
  Future<Either<AppErrorHandler, String>> call(AddMaterialParams parms) async {
    return await repository.addMaterial(params: parms);
  }
}
