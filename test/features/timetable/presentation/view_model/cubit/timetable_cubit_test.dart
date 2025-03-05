// test/features/timetable/cubit/timetable_cubit_test.dart

import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/timetable/domain/entity/request/post_timetable_params.dart';
import 'package:college_community/features/timetable/domain/entity/time_table_entity.dart';
import 'package:college_community/features/timetable/domain/usecase/get_timetable_usecase.dart';
import 'package:college_community/features/timetable/domain/usecase/post_timetable_usecase.dart';
import 'package:college_community/features/timetable/presentation/view_model/cubit/timetable_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Mock Classes
class MockGetTimeTableUsecase extends Mock implements GetTimeTableUsecase {}

class MockPostTimetableUsecase extends Mock implements PostTimetableUsecase {}

void main() {
  late MockGetTimeTableUsecase mockGetTimeTableUsecase;
  late MockPostTimetableUsecase mockPostTimetableUsecase;
  late TimetableCubit timetableCubit;

  setUp(() {
    mockGetTimeTableUsecase = MockGetTimeTableUsecase();
    mockPostTimetableUsecase = MockPostTimetableUsecase();
    timetableCubit = TimetableCubit(
      getTimeTableUsecase: mockGetTimeTableUsecase,
      postTimetableUsecase: mockPostTimetableUsecase,
    );
  });

  group('TimetableCubit', () {
    test('initial state should be correctly initialized', () {
      expect(timetableCubit.state, TimetableState.initially());
    });

    blocTest<TimetableCubit, TimetableState>(
      'should emit loading and then success state when postTimetable is successful',
      build: () {
        // Mock the successful response from the PostTimetableUsecase
        when(mockPostTimetableUsecase.call(PostTimetableParams(
          branch: 'Computer Science',
          semester: 'Fall 2023',
          type: 'Timetable',
          timeTableFile: File('path/to/your/timetable/file.pdf'),
        ))).thenAnswer((_) async => const Right('Timetable uploaded successfully'));

        return timetableCubit;
      },
      act: (cubit) => cubit.postTimetable(
        params: PostTimetableParams(
          branch: 'Computer Science',
          semester: 'Fall 2023',
          type: 'timetable',
          timeTableFile: File('path/to/file'),
        ),
        context: MockBuildContext(),
      ),
      expect: () => [
        TimetableState.initially().copyWith(isLoadingState: true),
        TimetableState.initially().copyWith(
          isLoadingState: false,
          isSuccessState: true,
        ),
      ],
    );

    blocTest<TimetableCubit, TimetableState>(
      'should emit loading and then error state when postTimetable fails',
      build: () {
        // Mock the error response from PostTimetableUsecase
        when(mockPostTimetableUsecase.call(PostTimetableParams(
          branch: 'Computer Science',
          semester: 'Fall 2023',
          type: 'Timetable',
          timeTableFile: File('path/to/your/timetable/file.pdf'),
        ))).thenAnswer((_) async => Left(AppErrorHandler(message: 'Failed to upload timetable')));

        return timetableCubit;
      },
      act: (cubit) => cubit.postTimetable(
        params: PostTimetableParams(
          branch: 'Computer Science',
          semester: 'Fall 2023',
          type: 'timetable',
          timeTableFile: File('path/to/file'),
        ),
        context: MockBuildContext(),
      ),
      expect: () => [
        TimetableState.initially().copyWith(isLoadingState: true),
        TimetableState.initially().copyWith(
          errorState: AppErrorHandler(message: 'Failed to upload timetable'),
          isLoadingState: false,
        ),
      ],
    );

    blocTest<TimetableCubit, TimetableState>(
      'should emit loading and then success state when getTimetable is successful',
      build: () {
        // Mock the successful response from GetTimeTableUsecase
        when(mockGetTimeTableUsecase.call(null)).thenAnswer((_) async => Right([TimetableEntity()]));

        return timetableCubit;
      },
      act: (cubit) => cubit.getTimetable(),
      expect: () => [
        TimetableState.initially().copyWith(isLoadingState: true),
        TimetableState.initially().copyWith(
          isLoadingState: false,
          isSuccessState: true,
          timetableList: [TimetableEntity()],
        ),
      ],
    );

    blocTest<TimetableCubit, TimetableState>(
      'should emit loading and then error state when getTimetable fails',
      build: () {
        // Mock the error response from GetTimeTableUsecase
        when(mockGetTimeTableUsecase.call(null)).thenAnswer((_) async => Left(AppErrorHandler(message: 'Failed to fetch timetable')));

        return timetableCubit;
      },
      act: (cubit) => cubit.getTimetable(),
      expect: () => [
        TimetableState.initially().copyWith(isLoadingState: true),
        TimetableState.initially().copyWith(
          errorState: AppErrorHandler(message: 'Failed to fetch timetable'),
          isLoadingState: false,
        ),
      ],
    );
  });
}

// MockBuildContext for testing
class MockBuildContext extends Mock implements BuildContext {}
