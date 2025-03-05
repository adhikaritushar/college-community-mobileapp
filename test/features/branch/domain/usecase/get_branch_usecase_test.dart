import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/branch/domain/entity/branch_entity.dart';
import 'package:college_community/features/branch/domain/repository/branch_repository.dart';
import 'package:college_community/features/branch/domain/usecase/get_branch_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBranchRepository extends Mock implements BranchRepository {}

void main() {
  late GetBranchUsecase usecase;
  late MockBranchRepository mockRepository;

  setUp(() {
    mockRepository = MockBranchRepository();
    usecase = GetBranchUsecase(repository: mockRepository);
  });

  final List<BranchEntity> branchEntities = [
    BranchEntity(id: "1", name: "Computer Science"),
    BranchEntity(id: "2", name: "Mechanical Engineering"),
  ];

  test('should return List<BranchEntity> from repository', () async {
    // Arrange
    when(() => mockRepository.getBranch()).thenAnswer((_) async => Right(branchEntities));

    // Act
    final result = await usecase(null);

    // Assert
    expect(result, Right(branchEntities));
    verify(() => mockRepository.getBranch()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return AppErrorHandler when repository fails', () async {
    // Arrange
    final error = AppErrorHandler(message: "Server error");
    when(() => mockRepository.getBranch()).thenAnswer((_) async => Left(error));

    // Act
    final result = await usecase(null);

    // Assert
    expect(result, Left(error));
    verify(() => mockRepository.getBranch()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
