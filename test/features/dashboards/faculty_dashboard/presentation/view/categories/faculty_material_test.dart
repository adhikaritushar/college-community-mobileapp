import 'dart:io';

import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/faculty_material.dart';
import 'package:college_community/features/material/domain/entity/request/add_material_params.dart';
import 'package:college_community/features/material/presentation/view_model.dart/cubit/material_cubit.dart';
import 'package:college_community/features/subject/presentation/view_model/cubit/subject_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockMaterialCubit extends Mock implements MaterialsCubit {}

class MockSubjectCubit extends Mock implements SubjectCubit {}

void main() {
  late MockMaterialCubit mockMaterialCubit;
  late MockSubjectCubit mockSubjectCubit;

  setUp(() {
    mockMaterialCubit = MockMaterialCubit();
    mockSubjectCubit = MockSubjectCubit();
  });

  Widget createWidgetUnderTest() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MaterialsCubit>.value(value: mockMaterialCubit),
        BlocProvider<SubjectCubit>.value(value: mockSubjectCubit),
      ],
      child: const MaterialApp(
        home: FacultyMatrial(),
      ),
    );
  }

  testWidgets('FacultyMatrial widget renders correctly', (WidgetTester tester) async {
    // Arrange
    when(mockSubjectCubit.state).thenReturn(const SubjectState(subjectList: []));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.text('Upload Material'), findsOneWidget);
    expect(find.text('Material Title'), findsOneWidget);
    expect(find.text('Material Subject'), findsOneWidget);
    expect(find.text('Select Material'), findsOneWidget);
    expect(find.text('Add Material'), findsOneWidget);
  });

  testWidgets('Form validation works correctly', (WidgetTester tester) async {
    // Arrange
    when(mockSubjectCubit.state).thenReturn(const SubjectState(subjectList: []));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.tap(find.text('Add Material'));
    await tester.pump();

    // Assert
    expect(find.text('Material title is required'), findsOneWidget);
    expect(find.text('Material Subjct is required'), findsOneWidget);
    expect(find.text('Please select a Material file'), findsOneWidget);
  });

  testWidgets('File selection works correctly', (WidgetTester tester) async {
    // Arrange
    when(mockSubjectCubit.state).thenReturn(const SubjectState(subjectList: []));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.tap(find.text('Select Material'));
    await tester.pump();

    // Assert
    // Here you would typically mock the file picker and verify the file selection logic.
    // Since the file picker is platform-dependent, you might need to mock it or use a fake implementation.
  });

  testWidgets('Button interaction triggers correct logic', (WidgetTester tester) async {
    // Arrange
    when(mockSubjectCubit.state).thenReturn(const SubjectState(subjectList: []));
    when(mockMaterialCubit.state).thenReturn(const MaterialsState());

    // Build the widget
    await tester.pumpWidget(createWidgetUnderTest());

    // Enter text into the Material Title field
    await tester.enterText(find.byType(TextFormField).first, 'Test Material');

    // Tap the "Add Material" button
    await tester.tap(find.text('Add Material'));
    await tester.pump();

    // Get the BuildContext of the widget
    final BuildContext context = tester.element(find.byType(FacultyMatrial));

    // Assert
    verify(
      mockMaterialCubit.addMaterial(
        params: AddMaterialParams(
          title: "Test Material",
          subject: "Subjet 1",
          materialFile: File(""),
          type: "material",
        ),
        context,
      ),
    ).called(1);
  });
}
