import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/features/notice/data/datasource/remote_datasourcce/notice_remote_datasource.dart';
import 'package:college_community/features/notice/data/models/notice_model.dart';
import 'package:college_community/features/notice/domain/entities/request/notice_add_update_params.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

// Mock class for GenericApiHandler
class MockGenericApiHandler extends Mock implements GenericApiHandler {}

void main() {
  group('NoticeRemoteDataSourceImpl', () {
    late MockGenericApiHandler mockApiHandler;
    late NoticeRemoteDataSourceImpl noticeRemoteDataSource;

    setUp(() {
      mockApiHandler = MockGenericApiHandler();
      noticeRemoteDataSource = NoticeRemoteDataSourceImpl(apiHandler: mockApiHandler);
    });

    // Test for getNotice
    test('should return a list of NoticeModel on success', () async {
      // Arrange
      final mockResponse = {
        'notice': [
          {'id': '1', 'title': 'Test Notice', 'description': 'Test Description', 'link': 'test.com', 'type': 'info'}
        ]
      };
      when(mockApiHandler.request(
        method: ApiMethod.GET,
        path: ApiEndpoint.getNoticeURL,
      )).thenAnswer((_) async => Right(mockResponse));

      // Act
      final result = await noticeRemoteDataSource.getNotice();

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected Right, but got Left'),
        (r) {
          expect(r, isA<List<NoticeModel>>());
          expect(r.length, 1);
          expect(r[0].title, 'Test Notice');
        },
      );
    });

    test('should return an error if the API call fails', () async {
      // Arrange
      when(mockApiHandler.request(
        method: ApiMethod.GET,
        path: ApiEndpoint.getNoticeURL,
      )).thenAnswer((_) async => Left(AppErrorHandler(message: 'Error')));

      // Act
      final result = await noticeRemoteDataSource.getNotice();

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (l) {
          expect(l.message, 'Error');
        },
        (r) => fail('Expected Left, but got Right'),
      );
    });

    // Test for addNotice
    test('should return success message on adding a notice', () async {
      // Arrange
      final params = NoticeAddUpdateParams(
        description: 'Test description',
        link: 'test.com',
        title: 'Test title',
        type: 'info',
      );
      final mockResponse = {'message': 'Notice added successfully'};
      when(mockApiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.addNoticeURL,
        data: {
          "description": params.description,
          "link": params.link,
          "title": params.title,
          "type": params.type,
        },
      )).thenAnswer((_) async => Right(mockResponse));

      // Act
      final result = await noticeRemoteDataSource.addNotice(params: params);

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected Right, but got Left'),
        (r) {
          expect(r, 'Notice added successfully');
        },
      );
    });

    test('should return error message if adding a notice fails', () async {
      // Arrange
      final params = NoticeAddUpdateParams(
        description: 'Test description',
        link: 'test.com',
        title: 'Test title',
        type: 'info',
      );
      when(mockApiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.addNoticeURL,
        data: {
          "description": params.description,
          "link": params.link,
          "title": params.title,
          "type": params.type,
        },
      )).thenAnswer((_) async => Left(AppErrorHandler(message: 'Error')));

      // Act
      final result = await noticeRemoteDataSource.addNotice(params: params);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (l) {
          expect(l.message, 'Error');
        },
        (r) => fail('Expected Left, but got Right'),
      );
    });

    // Test for updateNotice
    test('should return success message on updating a notice', () async {
      // Arrange
      final params = NoticeAddUpdateParams(
        description: 'Updated description',
        link: 'testupdate.com',
        title: 'Updated title',
        type: 'update',
        id: '1',
      );
      final mockResponse = {'message': 'Notice updated successfully'};
      when(mockApiHandler.request(
        method: ApiMethod.PUT,
        path: "${ApiEndpoint.updateNoticeURL}/${params.id}",
        data: {
          "description": params.description,
          "link": params.link,
          "title": params.title,
          "type": params.type,
        },
      )).thenAnswer((_) async => Right(mockResponse));

      // Act
      final result = await noticeRemoteDataSource.updateNotice(params: params);

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected Right, but got Left'),
        (r) {
          expect(r, 'Notice updated successfully');
        },
      );
    });

    test('should return error message if updating a notice fails', () async {
      // Arrange
      final params = NoticeAddUpdateParams(
        description: 'Updated description',
        link: 'testupdate.com',
        title: 'Updated title',
        type: 'update',
        id: '1',
      );
      when(mockApiHandler.request(
        method: ApiMethod.PUT,
        path: "${ApiEndpoint.updateNoticeURL}/${params.id}",
        data: {
          "description": params.description,
          "link": params.link,
          "title": params.title,
          "type": params.type,
        },
      )).thenAnswer((_) async => Left(AppErrorHandler(message: 'Error')));

      // Act
      final result = await noticeRemoteDataSource.updateNotice(params: params);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (l) {
          expect(l.message, 'Error');
        },
        (r) => fail('Expected Left, but got Right'),
      );
    });

    // Test for deleteNotice
    test('should return success message on deleting a notice', () async {
      // Arrange
      final mockResponse = {'message': 'Notice deleted successfully'};
      const noticeId = '1';
      when(mockApiHandler.request(
        method: ApiMethod.DELETE,
        path: "${ApiEndpoint.deleteNoticeURL}/$noticeId",
      )).thenAnswer((_) async => Right(mockResponse));

      // Act
      final result = await noticeRemoteDataSource.deleteNotice(id: noticeId);

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected Right, but got Left'),
        (r) {
          expect(r, 'Notice deleted successfully');
        },
      );
    });

    test('should return error message if deleting a notice fails', () async {
      // Arrange
      const noticeId = '1';
      when(mockApiHandler.request(
        method: ApiMethod.DELETE,
        path: "${ApiEndpoint.deleteNoticeURL}/$noticeId",
      )).thenAnswer((_) async => Left(AppErrorHandler(message: 'Error')));

      // Act
      final result = await noticeRemoteDataSource.deleteNotice(id: noticeId);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (l) {
          expect(l.message, 'Error');
        },
        (r) => fail('Expected Left, but got Right'),
      );
    });
  });
}
