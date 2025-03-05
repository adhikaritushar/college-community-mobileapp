import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/features/material/data/models/material_model.dart';
import 'package:college_community/features/material/domain/entity/request/add_material_params.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class MaterialRemoteDatasource {
  Future<Either<AppErrorHandler, List<MaterialModel>>> getMaterial({required String subject});
  Future<Either<AppErrorHandler, String>> addMaterial({required AddMaterialParams params});
}

class MaterialRemoteDatasourceImpl implements MaterialRemoteDatasource {
  final GenericApiHandler apiHandler;

  MaterialRemoteDatasourceImpl({required this.apiHandler});
  @override
  Future<Either<AppErrorHandler, List<MaterialModel>>> getMaterial({required String subject}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.getMaterialURL,
        data: {"subject": subject},
      );

      return response.fold(
        (l) => left(l),
        (r) => right(MaterialModel.listfromJson(r['material'])),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorHandler, String>> addMaterial({required AddMaterialParams params}) async {
    try {
      final response = await apiHandler.request(
          method: ApiMethod.POST,
          path: ApiEndpoint.addMaterialURL,
          options: Options(contentType: 'multipart/form-data'),
          data: FormData.fromMap({
            "title": params.title,
            "subject": params.subject,
            "faculty": "faculty middle",
            "type": "material",
            'material': await MultipartFile.fromFile(params.materialFile.path.toString(), filename: params.materialFile.path),
          }));

      return response.fold(
        (l) => left(l),
        (r) => right(r['message']),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }
}
