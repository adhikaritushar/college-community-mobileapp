import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/material/domain/entity/material_entity.dart';
import 'package:college_community/features/material/domain/entity/request/add_material_params.dart';

abstract class MaterialRepository {
  Future<Either<AppErrorHandler, List<MaterialEntity>>> getMaterial({required String subject});
  Future<Either<AppErrorHandler, String>> addMaterial({required AddMaterialParams params});
}
