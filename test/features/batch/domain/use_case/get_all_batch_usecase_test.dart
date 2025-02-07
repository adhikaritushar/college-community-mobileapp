import 'package:college_community_main/features/batch/domain/entity/batch_entity.dart';
import 'package:college_community_main/features/batch/domain/use_case/get_all_batch_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';


import 'repository_mock.dart';

void main() {
  late MockBatchRepository repository;
  late GetAllBatchUseCase usecase;

  setUp(() {
    repository = MockBatchRepository();
    usecase = GetAllBatchUseCase(batchRepository: repository);
  });

  final tbatch = BatchEntity(
    batchId: '1',
    batchName: 'Test Batch',
  );

  final tbatch2 = BatchEntity(
    batchId: '2',
    batchName: 'Test Batch',
  );
  final tbatches = [tbatch, tbatch2];

  test('should get all batches from repository', () async {
    // Arrange
    when(() => repository.getBatches())
        .thenAnswer((_) async => Right(tbatches));

    // Act
    final result = await usecase();

    // Assert
    expect(result, Right(tbatches));

    // Verify
    verify(() => repository.getBatches()).called(1);
  });
}