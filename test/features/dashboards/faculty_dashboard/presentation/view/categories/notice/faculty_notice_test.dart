import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/notice/faculty_add_notice.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/notice/faculty_edit_notice.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/notice/faculty_notice.dart';
import 'package:college_community/features/notice/domain/entities/notice_entity.dart';
import 'package:college_community/features/notice/presentation/view_model/cubit/notice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNoticeCubit extends Mock implements NoticeCubit {}

void main() {
  late MockNoticeCubit mockNoticeCubit;

  setUp(() {
    mockNoticeCubit = MockNoticeCubit();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<NoticeCubit>(
        create: (context) => mockNoticeCubit,
        child: const FacultyNotice(),
      ),
    );
  }

  testWidgets('FacultyNotice widget renders correctly', (WidgetTester tester) async {
    // Arrange
    when(mockNoticeCubit.state).thenReturn(NoticeState(noteList: [
      NoticeEntity(
        id: "1",
        title: "Test Notice 1",
        description: "This is a test notice",
        type: "General",
        createdAt: DateTime.now().toString(),
      ),
    ]));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    // Assert
    expect(find.text('Faculty Notice'), findsOneWidget); // AppBar title
    expect(find.text('Notice'), findsOneWidget); // Page title
    expect(find.text('Create Note'), findsOneWidget); // Create Note button
    expect(find.text('Test Notice 1'), findsOneWidget); // Notice title
    expect(find.text('This is a test notice'), findsOneWidget); // Notice description
  });

  testWidgets('Create Note button navigates to FacultyAddNotice', (WidgetTester tester) async {
    // Arrange
    when(mockNoticeCubit.state).thenReturn(const NoticeState(noteList: []));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.tap(find.text('Create Note'));
    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(FacultyAddNotice), findsOneWidget); // Verify navigation
  });

  testWidgets('Popup menu opens and Edit option navigates to FacultyEditNotice', (WidgetTester tester) async {
    // Arrange
    when(mockNoticeCubit.state).thenReturn(NoticeState(noteList: [
      NoticeEntity(
        id: "1",
        title: "Test Notice 1",
        description: "This is a test notice",
        type: "General",
        createdAt: DateTime.now().toString(),
      ),
    ]));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.tap(find.byType(PopupMenuButton<int>).first); // Open popup menu
    await tester.pumpAndSettle();
    await tester.tap(find.text('Edit')); // Tap Edit option
    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(FacultyEditNotice), findsOneWidget); // Verify navigation
  });

  testWidgets('Popup menu opens and Delete option triggers deleteNotice', (WidgetTester tester) async {
    // Arrange
    when(mockNoticeCubit.state).thenReturn(NoticeState(noteList: [
      NoticeEntity(
        id: "1",
        title: "Test Notice 1",
        description: "This is a test notice",
        type: "General",
        createdAt: DateTime.now().toString(),
      ),
    ]));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.tap(find.byType(PopupMenuButton<int>).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();
    final BuildContext context = tester.element(find.byType(FacultyNotice));
    // Assert
    verify(mockNoticeCubit.deleteNotice(id: "1", context: context)).called(1);
  });
}
