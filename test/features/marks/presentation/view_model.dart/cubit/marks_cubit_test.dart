import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/marks/domain/entity/marks_entity.dart';
import 'package:college_community/features/marks/domain/entity/request/add_marks_params.dart';
import 'package:college_community/features/marks/domain/usecase/add_marks_usecase.dart';
import 'package:college_community/features/marks/domain/usecase/get_marks_usecase.dart';
import 'package:college_community/features/marks/presentation/view_model.dart/cubit/marks_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Mock classes using Mockito
class MockGetMarksUsecase extends Mock implements GetMarksUsecase {}

class MockAddMarksUsecase extends Mock implements AddMarksUsecase {}

void main() {
  late MarksCubit marksCubit;
  late MockGetMarksUsecase mockGetMarksUsecase;
  late MockAddMarksUsecase mockAddMarksUsecase;

  setUp(() {
    // Initialize the mock objects
    mockGetMarksUsecase = MockGetMarksUsecase();
    mockAddMarksUsecase = MockAddMarksUsecase();
    marksCubit = MarksCubit(
      getMarksUsecase: mockGetMarksUsecase,
      addMarksUsecase: mockAddMarksUsecase,
    );
  });

  group('MarksCubit', () {
    test('should emit loading and success states when marks are fetched', () async {
      // Arrange
      final marksList = [
        MarksEntity(id: '1', enrollmentNo: 123, internal: {}, external: {}),
      ];

      when(mockGetMarksUsecase.call(123)).thenAnswer((_) async => Right(marksList));

      // Act
      marksCubit.getMarks(enrollmentNo: 123);

      // Assert
      expectLater(
        marksCubit.stream,
        emitsInOrder([
          MarksState.initially().copyWith(isLoadingState: true), // Initial loading state
          MarksState.initially().copyWith(
            isLoadingState: false,
            isSuccessState: true,
            marksList: marksList,
          ),
        ]),
      );
    });

    test('should emit loading and error states when marks fetching fails', () async {
      // Arrange
      final error = AppErrorHandler(message: 'Failed to fetch marks');

      when(mockGetMarksUsecase.call(123)).thenAnswer((_) async => Left(error));

      // Act
      marksCubit.getMarks(enrollmentNo: 123);

      // Assert
      expectLater(
        marksCubit.stream,
        emitsInOrder([
          MarksState.initially().copyWith(isLoadingState: true), // Initial loading state
          MarksState.initially().copyWith(
            isLoadingState: false,
            errorState: error,
          ),
        ]),
      );
    });

    test('should emit loading and success states when marks are added', () async {
      // Arrange
      final params = AddMarksParams(enrollmentNo: "123", examType: {"internal": "internal example"}, isInternal: true);
      const successMessage = 'Marks added successfully';

      when(mockAddMarksUsecase.call(params)).thenAnswer((_) async => const Right(successMessage));

      // Act
      marksCubit.addMarks(MockBuildContext(), params: params);

      // Assert
      expectLater(
        marksCubit.stream,
        emitsInOrder([
          MarksState.initially().copyWith(isLoadingState: true), // Initial loading state
          MarksState.initially().copyWith(
            isLoadingState: false,
            isSuccessState: true,
          ),
        ]),
      );
    });

    test('should emit loading and error states when adding marks fails', () async {
      // Arrange
      final params = AddMarksParams(enrollmentNo: "123", examType: {"internal": "internal example"}, isInternal: true);

      final error = AppErrorHandler(message: 'Failed to add marks');

      when(mockAddMarksUsecase.call(params)).thenAnswer((_) async => Left(error));

      // Act
      marksCubit.addMarks(MockBuildContext(), params: params);

      // Assert
      expectLater(
        marksCubit.stream,
        emitsInOrder([
          MarksState.initially().copyWith(isLoadingState: true), // Initial loading state
          MarksState.initially().copyWith(
            isLoadingState: false,
            errorState: error,
          ),
        ]),
      );
    });
  });
}

class MockBuildContext extends Mock implements BuildContext {}
