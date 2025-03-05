import 'package:college_community/features/dashboards/student_dashboard/presentation/view/categories/student_notice.dart';
import 'package:college_community/features/notice/domain/entities/notice_entity.dart';
import 'package:college_community/features/notice/presentation/view_model/cubit/notice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock NoticeCubit
class MockNoticeCubit extends Mock implements NoticeCubit {}

// Mock NoticeState
class FakeNoticeState extends Fake implements NoticeState {}

void main() {
  late MockNoticeCubit mockNoticeCubit;

  setUp(() {
    mockNoticeCubit = MockNoticeCubit();
  });

  setUpAll(() {
    registerFallbackValue(FakeNoticeState());
  });

  // Helper function to create the widget with a mocked NoticeCubit
  Widget createWidgetUnderTest(NoticeState state) {
    return MaterialApp(
      home: BlocProvider<NoticeCubit>.value(
        value: mockNoticeCubit,
        child: const StudentNotice(),
      ),
    );
  }

  testWidgets('StudentNotice shows loading indicator when state is loading', (WidgetTester tester) async {
    // Arrange
    when(() => mockNoticeCubit.state).thenReturn(const NoticeState(isLoadingState: true, noteList: []));

    // Act
    await tester.pumpWidget(createWidgetUnderTest(mockNoticeCubit.state));

    // Assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('StudentNotice shows "No Data Found!!" when noteList is empty', (WidgetTester tester) async {
    // Arrange
    when(() => mockNoticeCubit.state).thenReturn(const NoticeState(isLoadingState: false, noteList: []));

    // Act
    await tester.pumpWidget(createWidgetUnderTest(mockNoticeCubit.state));

    // Assert
    expect(find.text('No Data Found!!'), findsOneWidget);
  });

  testWidgets('StudentNotice shows a list of notices when noteList is not empty', (WidgetTester tester) async {
    // Arrange
    final mockNotices = [
      NoticeEntity(
        title: 'Notice 1',
        description: 'This is the first notice',
        createdAt: DateTime.now().toString(),
      ),
      NoticeEntity(
        title: 'Notice 2',
        description: 'This is the second notice',
        createdAt: DateTime.now().toString(),
      ),
    ];

    when(() => mockNoticeCubit.state).thenReturn(NoticeState(isLoadingState: false, noteList: mockNotices));

    // Act
    await tester.pumpWidget(createWidgetUnderTest(mockNoticeCubit.state));

    // Assert
    expect(find.text('Notice 1'), findsOneWidget);
    expect(find.text('This is the first notice'), findsOneWidget);
    expect(find.text('Notice 2'), findsOneWidget);
    expect(find.text('This is the second notice'), findsOneWidget);
  });

  testWidgets('StudentNotice displays the correct date format', (WidgetTester tester) async {
    // Arrange
    final mockNotice = [
      NoticeEntity(
        title: 'Notice 1',
        description: 'This is the first notice',
        createdAt: '2023-10-01T12:34:56Z',
      ),
    ];

    when(() => mockNoticeCubit.state).thenReturn(NoticeState(isLoadingState: false, noteList: mockNotice));

    // Act
    await tester.pumpWidget(createWidgetUnderTest(mockNoticeCubit.state));

    // Assert
    expect(find.text('01/10/2023 12:34:56'), findsOneWidget);
  });
}
