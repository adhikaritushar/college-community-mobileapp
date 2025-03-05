import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/features/marks/data/marks_datasource/remote_datasource/marks_remote_datasource.dart';
import 'package:college_community/features/marks/data/models/marks_model.dart';
import 'package:college_community/features/marks/domain/entity/request/add_marks_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGenericApiHandler extends Mock implements GenericApiHandler {}

void main() {
  late MarksRemoteDatasourceImpl marksRemoteDatasource;
  late MockGenericApiHandler mockApiHandler;

  setUp(() {
    mockApiHandler = MockGenericApiHandler();
    marksRemoteDatasource = MarksRemoteDatasourceImpl(apiHandler: mockApiHandler);
  });

  group('MarksRemoteDatasourceImpl', () {
    test('should return a list of marks when getMarks is successful', () async {
      // Arrange
      const enrollmentNo = 12345;
      final marksResponse = {
        'Mark': [
          {'id': 1, 'marks': 80},
          {'id': 2, 'marks': 75}
        ]
      };

      when(() => mockApiHandler.request(
            method: ApiMethod.POST,
            path: ApiEndpoint.getmarksURL,
            data: {'enrollmentNo': enrollmentNo},
          )).thenAnswer((_) async => Right(marksResponse));

      // Act
      final result = await marksRemoteDatasource.getMarks(enrollmentNo: enrollmentNo);

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected success but got error'),
        (r) => expect(r, isA<List<MarksModel>>()),
      );
    });

    test('should return error when getMarks fails', () async {
      // Arrange
      const enrollmentNo = 12345;
      const errorMessage = 'Failed to fetch marks';

      when(() => mockApiHandler.request(
            method: ApiMethod.POST,
            path: ApiEndpoint.getmarksURL,
            data: {'enrollmentNo': enrollmentNo},
          )).thenAnswer((_) async => Left(AppErrorHandler(message: errorMessage)));

      // Act
      final result = await marksRemoteDatasource.getMarks(enrollmentNo: enrollmentNo);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (l) => expect(l.message, errorMessage),
        (r) => fail('Expected error but got success'),
      );
    });

    test('should return success message when addMarks is successful', () async {
      // Arrange
      final params = AddMarksParams(enrollmentNo: "12345", isInternal: true, examType: {"internal": "internal data"});
      const responseMessage = 'Marks added successfully';

      when(() => mockApiHandler.request(
            method: ApiMethod.POST,
            path: ApiEndpoint.addmarksURL,
            data: {
              'enrollmentNo': params.enrollmentNo,
              'internal': params.examType,
            },
          )).thenAnswer((_) async => const Right({'message': responseMessage}));

      // Act
      final result = await marksRemoteDatasource.addMarks(params: params);

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected success but got error'),
        (r) => expect(r, responseMessage),
      );
    });

    test('should return error when addMarks fails', () async {
      // Arrange
      final params = AddMarksParams(enrollmentNo: "12345", isInternal: true, examType: {"internal": "internal data"});
      const errorMessage = 'Failed to add marks';

      when(() => mockApiHandler.request(
            method: ApiMethod.POST,
            path: ApiEndpoint.addmarksURL,
            data: {
              'enrollmentNo': params.enrollmentNo,
              'internal': params.examType,
            },
          )).thenAnswer((_) async => Left(AppErrorHandler(message: errorMessage)));

      // Act
      final result = await marksRemoteDatasource.addMarks(params: params);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (l) => expect(l.message, errorMessage),
        (r) => fail('Expected error but got success'),
      );
    });
  });
}
