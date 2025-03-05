import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/features/branch/data/datasource/remote_datasource/branch_remote_datasource.dart';
import 'package:college_community/features/branch/data/models/branch_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGenericApiHandler extends Mock implements GenericApiHandler {}

void main() {
  late BranchRemoteDatasourceImpl datasource;
  late MockGenericApiHandler mockApiHandler;

  setUp(() {
    mockApiHandler = MockGenericApiHandler();
    datasource = BranchRemoteDatasourceImpl(apiHandler: mockApiHandler);
    registerFallbackValue(ApiMethod.GET);
  });

  group('getBranch', () {
    final List<Map<String, dynamic>> mockJsonResponse = [
      {"id": 1, "name": "Computer Science"},
      {"id": 2, "name": "Mechanical Engineering"},
    ];

    final List<BranchModel> expectedBranches = [
      BranchModel(id: "1", name: "Computer Science"),
      BranchModel(id: "2", name: "Mechanical Engineering"),
    ];

    test('should return List<BranchModel> on successful API call', () async {
      // Arrange
      when(() => mockApiHandler.request(
            method: ApiMethod.GET,
            path: ApiEndpoint.getBranchURL,
          )).thenAnswer((_) async => right({'branches': mockJsonResponse}));

      // Act
      final result = await datasource.getBranch();

      // Assert
      expect(result, Right(expectedBranches));
      verify(() => mockApiHandler.request(
            method: ApiMethod.GET,
            path: ApiEndpoint.getBranchURL,
          )).called(1);
      verifyNoMoreInteractions(mockApiHandler);
    });

    test('should return AppErrorHandler on DioException', () async {
      // Arrange
      when(() => mockApiHandler.request(
            method: ApiMethod.GET,
            path: ApiEndpoint.getBranchURL,
          )).thenThrow(DioException(requestOptions: RequestOptions(path: ApiEndpoint.getBranchURL)));

      // Act
      final result = await datasource.getBranch();

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (error) => expect(error, isA<AppErrorHandler>()),
        (success) => fail("Should not return success"),
      );
    });

    test('should return AppErrorHandler on generic exception', () async {
      // Arrange
      when(() => mockApiHandler.request(
            method: ApiMethod.GET,
            path: ApiEndpoint.getBranchURL,
          )).thenThrow(Exception("Unexpected error"));

      // Act
      final result = await datasource.getBranch();

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (error) {
          expect(error, isA<AppErrorHandler>());
          expect(error.message, contains("Unexpected error"));
        },
        (success) => fail("Should not return success"),
      );
    });
  });
}
