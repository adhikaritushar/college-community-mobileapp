import 'package:dio/dio.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();

  final Dio dio;

  DioClient._internal() : dio = Dio() {
    dio
      ..options.baseUrl = ApiEndpoint.baseURL
      ..options.headers = ApiEndpoint.header
      ..options.connectTimeout = const Duration(seconds: ApiEndpoint.connectionTimeout)
      ..options.receiveTimeout = const Duration(seconds: ApiEndpoint.receiveTimeout)
      ..options.responseType = ResponseType.json
      ..interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
        ),
      );
  }

  factory DioClient() {
    return _instance;
  }
}
