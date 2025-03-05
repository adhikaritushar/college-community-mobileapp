import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/remote_service/handler/dio_service.dart';

enum ApiMethod {
  GET,
  POST,
  PUT,
  DELETE,
}

class GenericApiHandler {
  final DioClient dio;
  const GenericApiHandler({required this.dio});

  Future<Either<AppErrorHandler, T>> request<T>({
    required ApiMethod method,
    required String path,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
  }) async {
    try {
      Response response;

      switch (method) {
        case ApiMethod.GET:
          response = await dio.dio.get(path, queryParameters: queryParameters, options: options);
          break;
        case ApiMethod.POST:
          response = await dio.dio.post(path, data: data, queryParameters: queryParameters, options: options);
          break;
        case ApiMethod.PUT:
          response = await dio.dio.put(path, data: data, queryParameters: queryParameters, options: options);
          break;
        case ApiMethod.DELETE:
          response = await dio.dio.delete(path, queryParameters: queryParameters, options: options);
          break;
        default:
          throw Exception('Unsupported request method');
      }

      final result = response.data;
      return Right(result);
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.response?.data["message"]));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }
}
