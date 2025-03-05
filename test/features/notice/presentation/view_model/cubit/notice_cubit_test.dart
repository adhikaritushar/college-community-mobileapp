import 'package:bloc_test/bloc_test.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/notice/domain/entities/notice_entity.dart';
import 'package:college_community/features/notice/domain/entities/request/notice_add_update_params.dart';
import 'package:college_community/features/notice/domain/usecase/add_notice_usecase.dart';
import 'package:college_community/features/notice/domain/usecase/delete_notice_usecase.dart';
import 'package:college_community/features/notice/domain/usecase/get_notice_usecase.dart';
import 'package:college_community/features/notice/domain/usecase/update_notice_usecase.dart';
import 'package:college_community/features/notice/presentation/view_model/cubit/notice_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetNoticeUsecase extends Mock implements GetNoticeUsecase {}

class MockAddNoticeUsecase extends Mock implements AddNoticeUsecase {}

class MockUpdateNoticeUsecase extends Mock implements UpdateNoticeUsecase {}

class MockDeleteNoticeUsecase extends Mock implements DeleteNoticeUsecase {}

void main() {
  group('NoticeCubit Tests', () {
    late MockGetNoticeUsecase mockGetNoticeUsecase;
    late MockAddNoticeUsecase mockAddNoticeUsecase;
    late MockUpdateNoticeUsecase mockUpdateNoticeUsecase;
    late MockDeleteNoticeUsecase mockDeleteNoticeUsecase;
    late NoticeCubit noticeCubit;

    setUp(() {
      mockGetNoticeUsecase = MockGetNoticeUsecase();
      mockAddNoticeUsecase = MockAddNoticeUsecase();
      mockUpdateNoticeUsecase = MockUpdateNoticeUsecase();
      mockDeleteNoticeUsecase = MockDeleteNoticeUsecase();
      noticeCubit = NoticeCubit(
        getNoticeUsecase: mockGetNoticeUsecase,
        addNoticeUsecase: mockAddNoticeUsecase,
        updateNoticeUsecase: mockUpdateNoticeUsecase,
        deleteNoticeUsecase: mockDeleteNoticeUsecase,
      );
    });

    test('initial state is correctly set', () {
      expect(noticeCubit.state, NoticeState.initially());
    });

    // Test getNotice() - success
    blocTest<NoticeCubit, NoticeState>(
      'emits success state when getNotice is called successfully',
      build: () {
        when(mockGetNoticeUsecase.call(null)).thenAnswer(
          (_) async => Right([NoticeEntity(id: '1', title: 'Test Notice')]),
        );
        return noticeCubit;
      },
      act: (cubit) => cubit.getNotice(MockBuildContext()),
      expect: () => [
        const NoticeState(isLoadingState: true),
        NoticeState(isLoadingState: false, isSuccessState: true, noteList: [NoticeEntity(id: '1', title: 'Test Notice')]),
      ],
    );

    // Test getNotice() - error
    blocTest<NoticeCubit, NoticeState>(
      'emits error state when getNotice fails',
      build: () {
        when(mockGetNoticeUsecase.call(null)).thenAnswer(
          (_) async => Left(AppErrorHandler(message: 'Failed to fetch notices')),
        );
        return noticeCubit;
      },
      act: (cubit) => cubit.getNotice(MockBuildContext()),
      expect: () => [
        const NoticeState(isLoadingState: true),
        NoticeState(isLoadingState: false, errorState: AppErrorHandler(message: 'Failed to fetch notices')),
      ],
    );

    // Test addNotice() - success
    blocTest<NoticeCubit, NoticeState>(
      'emits success state when addNotice is called successfully',
      build: () {
        when(mockAddNoticeUsecase.call(NoticeAddUpdateParams(
          description: "This is a sample description for the notice.",
          link: "http://example.com/notice",
          title: "Important Notice",
          type: "Announcement",
          id: "12345", // Optional, if you're updating an existing notice
        ))).thenAnswer(
          (_) async => const Right('Notice added successfully'),
        );
        when(mockGetNoticeUsecase.call(null)).thenAnswer(
          (_) async => Right([NoticeEntity(id: '1', title: 'Test Notice')]),
        );
        return noticeCubit;
      },
      act: (cubit) => cubit.addNotice(params: NoticeAddUpdateParams(title: 'New Notice'), context: MockBuildContext()),
      expect: () => [
        const NoticeState(isLoadingState: true),
        const NoticeState(isLoadingState: false, isSuccessState: true),
      ],
    );

    // Test addNotice() - error
    blocTest<NoticeCubit, NoticeState>(
      'emits error state when addNotice fails',
      build: () {
        when(mockAddNoticeUsecase.call(NoticeAddUpdateParams(
          description: "This is a sample description for the notice.",
          link: "http://example.com/notice",
          title: "Important Notice",
          type: "Announcement",
          id: "12345", // Optional, if you're updating an existing notice
        ))).thenAnswer(
          (_) async => Left(AppErrorHandler(message: 'Failed to add notice')),
        );
        return noticeCubit;
      },
      act: (cubit) => cubit.addNotice(params: NoticeAddUpdateParams(title: 'New Notice'), context: MockBuildContext()),
      expect: () => [
        const NoticeState(isLoadingState: true),
        NoticeState(isLoadingState: false, errorState: AppErrorHandler(message: 'Failed to add notice')),
      ],
    );

    // Test updateNotice() - success
    blocTest<NoticeCubit, NoticeState>(
      'emits success state when updateNotice is called successfully',
      build: () {
        when(mockUpdateNoticeUsecase.call(NoticeAddUpdateParams(
          description: "This is a sample description for the notice.",
          link: "http://example.com/notice",
          title: "Important Notice",
          type: "Announcement",
          id: "12345", // Optional, if you're updating an existing notice
        ))).thenAnswer(
          (_) async => const Right('Notice updated successfully'),
        );
        when(mockGetNoticeUsecase.call(null)).thenAnswer(
          (_) async => Right([NoticeEntity(id: '1', title: 'Updated Notice')]),
        );
        return noticeCubit;
      },
      act: (cubit) => cubit.updateNotice(params: NoticeAddUpdateParams(title: 'Updated Notice'), context: MockBuildContext()),
      expect: () => [
        const NoticeState(isLoadingState: true),
        const NoticeState(isLoadingState: false, isSuccessState: true),
      ],
    );

    // Test deleteNotice() - success
    blocTest<NoticeCubit, NoticeState>(
      'emits success state when deleteNotice is called successfully',
      build: () {
        when(mockDeleteNoticeUsecase.call("1")).thenAnswer(
          (_) async => const Right('Notice deleted successfully'),
        );
        when(mockGetNoticeUsecase.call(null)).thenAnswer(
          (_) async => Right([NoticeEntity(id: '1', title: 'Test Notice')]),
        );
        return noticeCubit;
      },
      act: (cubit) => cubit.deleteNotice(id: '1', context: MockBuildContext()),
      expect: () => [
        const NoticeState(isLoadingState: true),
        const NoticeState(isLoadingState: false, isSuccessState: true),
      ],
    );

    // Test deleteNotice() - error
    blocTest<NoticeCubit, NoticeState>(
      'emits error state when deleteNotice fails',
      build: () {
        when(mockDeleteNoticeUsecase.call("1")).thenAnswer(
          (_) async => Left(AppErrorHandler(message: 'Failed to delete notice')),
        );
        return noticeCubit;
      },
      act: (cubit) => cubit.deleteNotice(id: '1', context: MockBuildContext()),
      expect: () => [
        const NoticeState(isLoadingState: true),
        NoticeState(isLoadingState: false, errorState: AppErrorHandler(message: 'Failed to delete notice')),
      ],
    );
  });
}

class MockBuildContext extends Mock implements BuildContext {}
