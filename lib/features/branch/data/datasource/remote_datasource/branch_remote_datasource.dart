import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/features/branch/data/models/branch_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class BranchRemoteDatasource {
  Future<Either<AppErrorHandler, List<BranchModel>>> getBranch();
  Future<Either<AppErrorHandler, String>> addBranch({required String branchName});
  Future<Either<AppErrorHandler, String>> deleteBranch({required String id});
}

class BranchRemoteDatasourceImpl implements BranchRemoteDatasource {
  final GenericApiHandler apiHandler;

  BranchRemoteDatasourceImpl({required this.apiHandler});

  @override
  Future<Either<AppErrorHandler, List<BranchModel>>> getBranch() async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.GET,
        path: ApiEndpoint.getBranchURL,
      );
      return response.fold(
        (l) => left(l),
        (r) => right(BranchModel.listfromJson(r['branches'])),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorHandler, String>> addBranch({required String branchName}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.addBranchURL,
        data: {
          'name': branchName,
        },
      );
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

  @override
  Future<Either<AppErrorHandler, String>> deleteBranch({required String id}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.DELETE,
        path: "${ApiEndpoint.deleteBranchURL}/$id",
      );
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
