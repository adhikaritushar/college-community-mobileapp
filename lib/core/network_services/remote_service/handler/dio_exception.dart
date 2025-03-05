import 'package:dio/dio.dart';
import 'package:college_community/core/network_services/remote_service/handler/exception_string.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = ExceptionString.cancelRequest;
        break;
      case DioExceptionType.connectionTimeout:
        message = ExceptionString.connectionTimeOut;
        break;
      case DioExceptionType.receiveTimeout:
        message = ExceptionString.receiveTimeOut;
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = ExceptionString.sendTimeOut;
        break;
      case DioExceptionType.unknown:
        if (dioError.message!.contains("Socket")) {
          message = ExceptionString.socketException;
          break;
        }
        message = ExceptionString.unexpectedError;
        break;
      default:
        message = ExceptionString.unknownError;
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return ExceptionString.badRequest;
      case 401:
        return ExceptionString.unauthorized;
      case 403:
        return ExceptionString.forbidden;
      case 404:
        return ExceptionString.notFound;
      case 422:
        return ExceptionString.duplicateEmail;
      case 500:
        return ExceptionString.internalServerError;
      case 502:
        return ExceptionString.badGateway;
      default:
        return ExceptionString.unknownError;
    }
  }

  @override
  String toString() => message;
}
