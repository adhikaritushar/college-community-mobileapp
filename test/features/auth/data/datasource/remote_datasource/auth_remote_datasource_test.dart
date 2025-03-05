import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/features/auth/data/datasource/remote_datasource/auth_remote_datasource.dart';
import 'package:college_community/features/auth/data/model/response/login_response_model.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiHandler extends Mock implements GenericApiHandler {}

void main() {
  late AuthRemoteDatasourceImpl datasource;
  late MockApiHandler mockApiHandler;

  setUp(() {
    mockApiHandler = MockApiHandler();
    datasource = AuthRemoteDatasourceImpl(apiHandler: mockApiHandler);
  });

  var testParams = LoginParams(loginID: "test_user", password: "password123");
  const testResponseData = {
    "token": "dummy_token",
    "user": {"id": 1, "name": "Test User"}
  };
  final testLoginResponseModel = LoginResponseModel.fromMap(testResponseData);

  void setUpMockApiHandlerSuccess(String url) {
    when(() => mockApiHandler.request(
          method: ApiMethod.POST,
          path: url,
          data: any(named: "data"),
        )).thenAnswer((_) async => right(testResponseData));
  }

  void setUpMockApiHandlerFailure(String url, String errorMessage) {
    when(() => mockApiHandler.request(
          method: ApiMethod.POST,
          path: url,
          data: any(named: "data"),
        )).thenAnswer((_) async => left(AppErrorHandler(message: errorMessage)));
  }

  group("Admin Login", () {
    test('should return LoginResponseModel on successful login', () async {
      setUpMockApiHandlerSuccess(ApiEndpoint.adminLoginURL);

      final result = await datasource.adminLogin(testParams);

      expect(result, right(testLoginResponseModel));
      verify(() => mockApiHandler.request(
            method: ApiMethod.POST,
            path: ApiEndpoint.adminLoginURL,
            data: {
              "loginid": testParams.loginID,
              "password": testParams.password,
            },
          )).called(1);
    });

    test('should return AppErrorHandler on failure', () async {
      setUpMockApiHandlerFailure(ApiEndpoint.adminLoginURL, "Admin login failed");

      final result = await datasource.adminLogin(testParams);

      expect(result, left(AppErrorHandler(message: "Admin login failed")));
    });
  });

  group("Faculty Login", () {
    test('should return LoginResponseModel on successful login', () async {
      setUpMockApiHandlerSuccess(ApiEndpoint.facultyLoginURL);

      final result = await datasource.facultyLogin(testParams);

      expect(result, right(testLoginResponseModel));
      verify(() => mockApiHandler.request(
            method: ApiMethod.POST,
            path: ApiEndpoint.facultyLoginURL,
            data: {
              "loginid": testParams.loginID,
              "password": testParams.password,
            },
          )).called(1);
    });

    test('should return AppErrorHandler on failure', () async {
      setUpMockApiHandlerFailure(ApiEndpoint.facultyLoginURL, "Faculty login failed");

      final result = await datasource.facultyLogin(testParams);

      expect(result, left(AppErrorHandler(message: "Faculty login failed")));
    });
  });

  group("Student Login", () {
    test('should return LoginResponseModel on successful login', () async {
      setUpMockApiHandlerSuccess(ApiEndpoint.studentLoginURL);

      final result = await datasource.studentLogin(testParams);

      expect(result, right(testLoginResponseModel));
      verify(() => mockApiHandler.request(
            method: ApiMethod.POST,
            path: ApiEndpoint.studentLoginURL,
            data: {
              "loginid": testParams.loginID,
              "password": testParams.password,
            },
          )).called(1);
    });

    test('should return AppErrorHandler on failure', () async {
      setUpMockApiHandlerFailure(ApiEndpoint.studentLoginURL, "Student login failed");

      final result = await datasource.studentLogin(testParams);

      expect(result, left(AppErrorHandler(message: "Student login failed")));
    });
  });
}
