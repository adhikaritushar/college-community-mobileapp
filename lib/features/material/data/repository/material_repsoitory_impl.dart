import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/material/data/datasource/remote_datasource/material_remote_datasource.dart';
import 'package:college_community/features/material/domain/entity/material_entity.dart';
import 'package:college_community/features/material/domain/entity/request/add_material_params.dart';
import 'package:college_community/features/material/domain/repository/material_repository.dart';

class MaterialRepsoitoryImpl extends MaterialRepository {
  final MaterialRemoteDatasource remoteDatasource;

  MaterialRepsoitoryImpl({required this.remoteDatasource});

  @override
  Future<Either<AppErrorHandler, String>> addMaterial({required AddMaterialParams params}) async {
    final result = await remoteDatasource.addMaterial(params: params);
    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  @override
  Future<Either<AppErrorHandler, List<MaterialEntity>>> getMaterial({required String subject}) async {
    final result = await remoteDatasource.getMaterial(subject: subject);
    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }
}
