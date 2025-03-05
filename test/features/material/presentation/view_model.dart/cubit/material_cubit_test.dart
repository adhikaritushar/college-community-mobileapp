import 'dart:io';

import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/material/domain/entity/material_entity.dart';
import 'package:college_community/features/material/domain/entity/request/add_material_params.dart';
import 'package:college_community/features/material/domain/usecase/add_material_usecase.dart';
import 'package:college_community/features/material/domain/usecase/get_material_usecase.dart';
import 'package:college_community/features/material/presentation/view_model.dart/cubit/material_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockGetMaterialUsecase extends Mock implements GetMaterialUsecase {}

class MockAddMaterialUsecase extends Mock implements AddMaterialUsecase {}

// Mock BuildContext for testing SnackBar or UI interactions
class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late MockGetMaterialUsecase mockGetMaterialUsecase;
  late MockAddMaterialUsecase mockAddMaterialUsecase;
  late MaterialsCubit materialsCubit;
  late MockBuildContext mockBuildContext;

  setUp(() {
    mockGetMaterialUsecase = MockGetMaterialUsecase();
    mockAddMaterialUsecase = MockAddMaterialUsecase();
    mockBuildContext = MockBuildContext();
    materialsCubit = MaterialsCubit(
      getMaterialUsecase: mockGetMaterialUsecase,
      addMaterialUsecase: mockAddMaterialUsecase,
    );
  });

  group('MaterialsCubit', () {
    const subject = 'Math';
    final materialList = [
      MaterialEntity(id: '1', title: 'Material 1', subject: 'Math'),
      MaterialEntity(id: '2', title: 'Material 2', subject: 'Math'),
    ];
    final addMaterialParams = AddMaterialParams(
      title: 'New Material',
      subject: 'Math',
      materialFile: File('path/to/material'),
    );

    test('should emit loading and success states when getMaterial succeeds', () async {
      // Arrange
      when(() => mockGetMaterialUsecase.call(subject)).thenAnswer((_) async => Right(materialList));

      // Act
      materialsCubit.getMaterial(mockBuildContext, subject: subject);

      // Assert
      expect(materialsCubit.state.isLoadingState, true);
      expect(materialsCubit.state.isSuccessState, true);
      expect(materialsCubit.state.materialList, materialList);
    });

    test('should emit loading and error states when getMaterial fails', () async {
      // Arrange
      final error = AppErrorHandler(message: 'Failed to fetch materials');
      when(() => mockGetMaterialUsecase.call(subject)).thenAnswer((_) async => Left(error));

      // Act
      materialsCubit.getMaterial(mockBuildContext, subject: subject);

      // Assert
      expect(materialsCubit.state.isLoadingState, true);
      expect(materialsCubit.state.errorState?.message, 'Failed to fetch materials');
    });

    test('should emit loading and success states when addMaterial succeeds', () async {
      // Arrange
      const successMessage = 'Material added successfully';
      when(() => mockAddMaterialUsecase.call(addMaterialParams)).thenAnswer((_) async => const Right(successMessage));

      // Act
      materialsCubit.addMaterial(mockBuildContext, params: addMaterialParams);

      // Assert
      expect(materialsCubit.state.isLoadingState, true);
      expect(materialsCubit.state.isSuccessState, true);
    });

    test('should emit loading and error states when addMaterial fails', () async {
      // Arrange
      final error = AppErrorHandler(message: 'Failed to add material');
      when(() => mockAddMaterialUsecase.call(addMaterialParams)).thenAnswer((_) async => Left(error));

      // Act
      materialsCubit.addMaterial(mockBuildContext, params: addMaterialParams);

      // Assert
      expect(materialsCubit.state.isLoadingState, true);
      expect(materialsCubit.state.errorState?.message, 'Failed to add material');
    });
  });
}
