import 'dart:io';

import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/features/material/data/datasource/remote_datasource/material_remote_datasource.dart';
import 'package:college_community/features/material/data/models/material_model.dart';
import 'package:college_community/features/material/domain/entity/request/add_material_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Generate mocks using mocktail
class MockGenericApiHandler extends Mock implements GenericApiHandler {}

void main() {
  late MockGenericApiHandler mockApiHandler;
  late MaterialRemoteDatasourceImpl materialRemoteDatasource;

  setUp(() {
    // Initialize mocks
    mockApiHandler = MockGenericApiHandler();
    materialRemoteDatasource = MaterialRemoteDatasourceImpl(apiHandler: mockApiHandler);
  });

  group('MaterialRemoteDatasourceImpl', () {
    test('should return List<MaterialModel> on successful getMaterial', () async {
      // Arrange
      const subject = 'Math';
      final materialList = [
        MaterialModel(id: '1', title: 'Material 1', subject: subject),
        MaterialModel(id: '2', title: 'Material 2', subject: subject),
      ];

      // Mock the response from apiHandler
      when(() => mockApiHandler.request(
            method: ApiMethod.POST,
            path: ApiEndpoint.getMaterialURL,
            data: {"subject": subject},
          )).thenAnswer(
        (_) async => Right({'material': materialList.map((e) => e.toMap()).toList()}),
      );

      // Act
      final result = await materialRemoteDatasource.getMaterial(subject: subject);

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected Right, got Left: ${l.message}'),
        (r) {
          expect(r.length, 2);
          expect(r.first.title, 'Material 1');
          expect(r.first.subject, subject);
        },
      );
    });

    test('should return error on failed getMaterial', () async {
      // Arrange
      const subject = 'Math';
      final error = AppErrorHandler(message: 'Failed to fetch material');

      // Mock the response from apiHandler
      when(() => mockApiHandler.request(
            method: ApiMethod.POST,
            path: ApiEndpoint.getMaterialURL,
            data: {"subject": subject},
          )).thenAnswer(
        (_) async => Left(error),
      );

      // Act
      final result = await materialRemoteDatasource.getMaterial(subject: subject);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (l) {
          expect(l.message, 'Failed to fetch material');
        },
        (r) => fail('Expected Left, got Right'),
      );
    });

    test('should return success message on successful addMaterial', () async {
      // Arrange
      final params = AddMaterialParams(
        title: 'Material Title',
        subject: 'Math',
        materialFile: File('path/to/file'),
      );
      const successMessage = 'Material added successfully';

      // Mock the response from apiHandler
      when(() => mockApiHandler.request(
            method: ApiMethod.POST,
            path: ApiEndpoint.addMaterialURL,
            data: any(named: 'data'),
          )).thenAnswer(
        (_) async => const Right({'message': successMessage}),
      );

      // Act
      final result = await materialRemoteDatasource.addMaterial(params: params);

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected Right, got Left: ${l.message}'),
        (r) {
          expect(r, successMessage);
        },
      );
    });

    test('should return error on failed addMaterial', () async {
      // Arrange
      final params = AddMaterialParams(
        title: 'Material Title',
        subject: 'Math',
        materialFile: File('path/to/file'),
      );
      final error = AppErrorHandler(message: 'Failed to add material');

      // Mock the response from apiHandler
      when(() => mockApiHandler.request(
            method: ApiMethod.POST,
            path: ApiEndpoint.addMaterialURL,
            data: any(named: 'data'),
          )).thenAnswer(
        (_) async => Left(error),
      );

      // Act
      final result = await materialRemoteDatasource.addMaterial(params: params);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (l) {
          expect(l.message, 'Failed to add material');
        },
        (r) => fail('Expected Left, got Right'),
      );
    });
  });
}
