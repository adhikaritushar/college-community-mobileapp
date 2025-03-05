import 'dart:io';

import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/material/domain/entity/request/add_material_params.dart';
import 'package:college_community/features/material/domain/repository/material_repository.dart';
import 'package:college_community/features/material/domain/usecase/add_material_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Create a mock class for the MaterialRepository
class MockMaterialRepository extends Mock implements MaterialRepository {}

void main() {
  late MockMaterialRepository mockMaterialRepository;
  late AddMaterialUsecase addMaterialUsecase;

  setUp(() {
    // Initialize the mock and the usecase
    mockMaterialRepository = MockMaterialRepository();
    addMaterialUsecase = AddMaterialUsecase(repository: mockMaterialRepository);
  });

  group('AddMaterialUsecase', () {
    test('should return success when repository adds material successfully', () async {
      // Arrange
      final addMaterialParams = AddMaterialParams(title: 'Material Title', subject: 'Math', materialFile: File('test/temp_material.txt'));
      const successMessage = 'Material added successfully';

      // Mock the repository response
      when(() => mockMaterialRepository.addMaterial(params: addMaterialParams)).thenAnswer((_) async => const Right(successMessage));

      // Act
      final result = await addMaterialUsecase.call(addMaterialParams);

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected Right, got Left'),
        (r) {
          expect(r, successMessage);
        },
      );
    });

    test('should return error when repository fails to add material', () async {
      // Arrange
      final addMaterialParams = AddMaterialParams(title: 'Material Title', subject: 'Math', materialFile: File('test/temp_material.txt'));
      final error = AppErrorHandler(message: 'Failed to add material');

      // Mock the repository response
      when(() => mockMaterialRepository.addMaterial(params: addMaterialParams)).thenAnswer((_) async => Left(error));

      // Act
      final result = await addMaterialUsecase.call(addMaterialParams);

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
