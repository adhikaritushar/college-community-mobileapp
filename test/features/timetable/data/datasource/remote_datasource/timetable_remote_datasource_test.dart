import 'dart:io';

import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/features/timetable/data/datasource/remote_datasource/timetable_remote_datasource.dart';
import 'package:college_community/features/timetable/data/models/time_table_model.dart';
import 'package:college_community/features/timetable/domain/entity/request/post_timetable_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGenericApiHandler extends Mock implements GenericApiHandler {}

void main() {
  late TimetableRemoteDatasourceImpl datasource;
  late MockGenericApiHandler mockApiHandler;

  setUp(() {
    mockApiHandler = MockGenericApiHandler();
    datasource = TimetableRemoteDatasourceImpl(apiHandler: mockApiHandler);
  });

  group('TimetableRemoteDatasourceImpl', () {
    test('should return timetable data when the GET request is successful', () async {
      // Arrange
      final mockResponse = [
        {
          'id': 1,
          'branch': 'Computer Science',
          'semester': 1,
        },
      ];
      when(mockApiHandler.request(
        method: ApiMethod.GET,
        path: ApiEndpoint.getTimetableURL,
      )).thenAnswer(
        (_) async => Right(mockResponse),
      );

      // Act
      final result = await datasource.getTimeTable();

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected Right, but got Left'),
        (r) {
          expect(r, isA<List<TimetableModel>>());
          expect(r.length, 1);
        },
      );
    });

    test('should return error when GET request fails', () async {
      // Arrange
      when(mockApiHandler.request(
        method: ApiMethod.GET,
        path: ApiEndpoint.getTimetableURL,
      )).thenAnswer(
        (_) async => Left(AppErrorHandler(message: 'Error occurred')),
      );

      // Act
      final result = await datasource.getTimeTable();

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (l) {
          expect(l.message, 'Error occurred');
        },
        (r) => fail('Expected Left, but got Right'),
      );
    });

    test('should return success message when POST request is successful', () async {
      // Arrange
      final params = PostTimetableParams(
        branch: 'Computer Science',
        semester: '1',
        type: "timetable",
        timeTableFile: File('path/to/file'),
      );
      final mockResponse = {'message': 'Timetable uploaded successfully'};
      when(mockApiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.postTimetableURL,
        options: anyNamed('options'),
        data: anyNamed('data'),
      )).thenAnswer(
        (_) async => Right(mockResponse),
      );

      // Act
      final result = await datasource.postTimeTable(params: params);

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected Right, but got Left'),
        (r) {
          expect(r, 'Timetable uploaded successfully');
        },
      );
    });

    test('should return error when POST request fails', () async {
      // Arrange
      final params = PostTimetableParams(
        branch: 'Computer Science',
        semester: '1',
        type: "timetable",
        timeTableFile: File('path/to/file'),
      );
      when(mockApiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.postTimetableURL,
        options: anyNamed('options'),
        data: anyNamed('data'),
      )).thenAnswer(
        (_) async => Left(AppErrorHandler(message: 'Error occurred')),
      );

      // Act
      final result = await datasource.postTimeTable(params: params);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (l) {
          expect(l.message, 'Error occurred');
        },
        (r) => fail('Expected Left, but got Right'),
      );
    });
  });
}
