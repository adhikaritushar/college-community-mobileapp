import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/material/domain/entity/material_entity.dart';
import 'package:college_community/features/material/domain/repository/material_repository.dart';
import 'package:college_community/features/material/domain/usecase/get_material_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Create a mock class for MaterialRepository
class MockMaterialRepository extends Mock implements MaterialRepository {}

void main() {
  late MockMaterialRepository mockMaterialRepository;
  late GetMaterialUsecase getMaterialUsecase;

  setUp(() {
    mockMaterialRepository = MockMaterialRepository();
    getMaterialUsecase = GetMaterialUsecase(repository: mockMaterialRepository);
  });

  group('GetMaterialUsecase', () {
    const subject = 'Math';

    test('should return a list of materials when repository call is successful', () async {
      // Arrange
      final materialList = [
        MaterialEntity(id: '1', title: 'Math Material 1', subject: 'Math'),
        MaterialEntity(id: '2', title: 'Math Material 2', subject: 'Math'),
      ];
      when(() => mockMaterialRepository.getMaterial(subject: subject)).thenAnswer((_) async => Right(materialList));

      // Act
      final result = await getMaterialUsecase.call(subject);

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected Right, got Left'),
        (r) {
          expect(r, materialList);
        },
      );
    });

    test('should return error when repository call fails', () async {
      // Arrange
      final error = AppErrorHandler(message: 'Failed to fetch materials');
      when(() => mockMaterialRepository.getMaterial(subject: subject)).thenAnswer((_) async => Left(error));

      // Act
      final result = await getMaterialUsecase.call(subject);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (l) {
          expect(l.message, 'Failed to fetch materials');
        },
        (r) => fail('Expected Left, got Right'),
      );
    });
  });
}
