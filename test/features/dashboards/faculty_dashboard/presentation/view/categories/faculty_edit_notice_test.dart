import 'package:college_community/core/common_widgets/k_drop_down_button.dart';
import 'package:college_community/core/common_widgets/k_elevation_button.dart';
import 'package:college_community/core/common_widgets/k_text_form_field.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/notice/faculty_edit_notice.dart';
import 'package:college_community/features/notice/domain/entities/notice_entity.dart';
import 'package:college_community/features/notice/domain/entities/request/notice_add_update_params.dart';
import 'package:college_community/features/notice/presentation/view_model/cubit/notice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock NoticeCubit
class MockNoticeCubit extends Mock implements NoticeCubit {}

void main() {
  late MockNoticeCubit mockNoticeCubit;
  late NoticeEntity mockNotice;

  setUp(() {
    mockNoticeCubit = MockNoticeCubit();
    mockNotice = NoticeEntity(
      id: "1",
      title: 'Test Title',
      description: 'Test Description',
      link: 'https://example.com',
      type: 'both',
      createdAt: '2023-10-01T12:34:56Z',
    );
  });

  // Helper function to create the widget with a mocked NoticeCubit
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<NoticeCubit>.value(
        value: mockNoticeCubit,
        child: FacultyEditNotice(noticedata: mockNotice),
      ),
    );
  }

  testWidgets('FacultyEditNotice renders all form fields pre-filled with notice data', (WidgetTester tester) async {
    // Arrange
    when(() => mockNoticeCubit.state).thenReturn(const NoticeState());

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.byType(KTextFormField), findsNWidgets(3)); // Title, Description, Link fields
    expect(find.byType(KDropdownButton), findsOneWidget); // Target Audience dropdown
    expect(find.byType(KElevatedButton), findsOneWidget); // Update Notice button

    // Verify pre-filled data
    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Description'), findsOneWidget);
    expect(find.text('https://example.com'), findsOneWidget);
    expect(find.text('Both'), findsOneWidget); // Dropdown pre-filled value
  });

  testWidgets('FacultyEditNotice triggers NoticeCubit.updateNotice when form is submitted', (WidgetTester tester) async {
    // Arrange
    when(() => mockNoticeCubit.state).thenReturn(const NoticeState());

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Modify the form fields
    await tester.enterText(find.byType(KTextFormField).at(0), 'Updated Title');
    await tester.enterText(find.byType(KTextFormField).at(1), 'Updated Description');
    await tester.enterText(find.byType(KTextFormField).at(2), 'https://updated.com');
    await tester.tap(find.byType(KDropdownButton));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Faculty').last);
    await tester.pumpAndSettle();

    // Submit the form
    await tester.tap(find.text('Update Notice'));
    await tester.pump();

    // Assert
    verify(() => mockNoticeCubit.updateNotice(
          params: NoticeAddUpdateParams(
            id: "1",
            title: 'Updated Title',
            description: 'Updated Description',
            link: 'https://updated.com',
            type: 'faculty',
          ),
          context: any(named: 'context'),
        )).called(1);
  });

  testWidgets('FacultyEditNotice shows loading indicator when NoticeCubit is in loading state', (WidgetTester tester) async {
    // Arrange
    when(() => mockNoticeCubit.state).thenReturn(const NoticeState(isLoadingState: true));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('FacultyEditNotice shows error message when NoticeCubit has an error', (WidgetTester tester) async {
    // Arrange
    when(() => mockNoticeCubit.state).thenReturn(NoticeState(errorState: AppErrorHandler(message: 'Failed to update notice')));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.text('Failed to update notice'), findsOneWidget);
  });
}
