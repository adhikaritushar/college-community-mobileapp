import 'package:college_community/core/common_widgets/k_drop_down_button.dart';
import 'package:college_community/core/common_widgets/k_elevation_button.dart';
import 'package:college_community/core/common_widgets/k_text_form_field.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/notice/faculty_add_notice.dart';
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

  setUp(() {
    mockNoticeCubit = MockNoticeCubit();
  });

  // Helper function to create the widget with a mocked NoticeCubit
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<NoticeCubit>.value(
        value: mockNoticeCubit,
        child: const FacultyAddNotice(),
      ),
    );
  }

  testWidgets('FacultyAddNotice renders all form fields and buttons', (WidgetTester tester) async {
    // Arrange
    when(() => mockNoticeCubit.state).thenReturn(const NoticeState());

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.byType(KTextFormField), findsNWidgets(3)); // Title, Description, Link fields
    expect(find.byType(KDropdownButton), findsOneWidget); // Target Audience dropdown
    expect(find.byType(KElevatedButton), findsOneWidget); // Add Notice button
  });

  testWidgets('FacultyAddNotice shows validation errors when form is submitted empty', (WidgetTester tester) async {
    // Arrange
    when(() => mockNoticeCubit.state).thenReturn(const NoticeState());

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.tap(find.text('Add Notice'));
    await tester.pump();

    // Assert
    expect(find.text('Notice Title is required'), findsOneWidget);
    expect(find.text('Notice Description is required'), findsOneWidget);
    expect(find.text('Target Audience is required'), findsOneWidget);
  });

  testWidgets('FacultyAddNotice triggers NoticeCubit.addNotice when form is valid', (WidgetTester tester) async {
    // Arrange
    when(() => mockNoticeCubit.state).thenReturn(const NoticeState());

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Fill in the form fields
    await tester.enterText(find.byType(KTextFormField).at(0), 'Test Title');
    await tester.enterText(find.byType(KTextFormField).at(1), 'Test Description');
    await tester.enterText(find.byType(KTextFormField).at(2), 'https://example.com');
    await tester.tap(find.byType(KDropdownButton));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Both').last);
    await tester.pumpAndSettle();

    // Submit the form
    await tester.tap(find.text('Add Notice'));
    await tester.pump();

    // Assert
    verify(() => mockNoticeCubit.addNotice(
          params: NoticeAddUpdateParams(
            title: 'Test Title',
            description: 'Test Description',
            link: 'https://example.com',
            type: 'both',
          ),
          context: any(named: 'context'),
        )).called(1);
  });

  testWidgets('FacultyAddNotice shows loading indicator when NoticeCubit is in loading state', (WidgetTester tester) async {
    // Arrange
    when(() => mockNoticeCubit.state).thenReturn(const NoticeState(isLoadingState: true));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('FacultyAddNotice shows error message when NoticeCubit has an error', (WidgetTester tester) async {
    // Arrange
    when(() => mockNoticeCubit.state).thenReturn(NoticeState(errorState: AppErrorHandler(message: 'Failed to add notice')));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.text('Failed to add notice'), findsOneWidget);
  });
}
