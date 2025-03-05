import 'package:college_community/core/common_widgets/k_drop_down_button.dart';
import 'package:college_community/features/dashboards/student_dashboard/presentation/view/categories/student_materials.dart';
import 'package:college_community/features/material/domain/entity/material_entity.dart';
import 'package:college_community/features/material/presentation/view_model.dart/cubit/material_cubit.dart';
import 'package:college_community/features/subject/domain/entity/subject_entity.dart';
import 'package:college_community/features/subject/presentation/view_model/cubit/subject_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes for Cubits
class MockSubjectCubit extends Mock implements SubjectCubit {}

class MockMaterialsCubit extends Mock implements MaterialsCubit {}

void main() {
  late MockSubjectCubit mockSubjectCubit;
  late MockMaterialsCubit mockMaterialsCubit;

  setUp(() {
    mockSubjectCubit = MockSubjectCubit();
    mockMaterialsCubit = MockMaterialsCubit();
  });

  testWidgets('StudentMaterials widget renders correctly', (WidgetTester tester) async {
    // Arrange
    when(() => mockSubjectCubit.state).thenReturn(SubjectState(subjectList: [
      SubjectEntity(name: 'Math'),
      SubjectEntity(name: 'Science'),
    ]));
    when(() => mockMaterialsCubit.state).thenReturn(const MaterialsState(materialList: []));

    // Act
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<SubjectCubit>.value(value: mockSubjectCubit),
          BlocProvider<MaterialsCubit>.value(value: mockMaterialsCubit),
        ],
        child: const MaterialApp(
          home: StudentMaterials(),
        ),
      ),
    );

    // Assert
    expect(find.text('Student Materials'), findsOneWidget);
    expect(find.text('Select Subject'), findsOneWidget);
    expect(find.byType(KDropdownButton), findsOneWidget);
  });

  testWidgets('Dropdown button shows subjects and selects one', (WidgetTester tester) async {
    // Arrange
    when(() => mockSubjectCubit.state).thenReturn(SubjectState(subjectList: [
      SubjectEntity(name: 'Math'),
      SubjectEntity(name: 'Science'),
    ]));
    when(() => mockMaterialsCubit.state).thenReturn(const MaterialsState(materialList: []));

    // Act
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<SubjectCubit>.value(value: mockSubjectCubit),
          BlocProvider<MaterialsCubit>.value(value: mockMaterialsCubit),
        ],
        child: const MaterialApp(
          home: StudentMaterials(),
        ),
      ),
    );

    // Tap on the dropdown button
    await tester.tap(find.byType(KDropdownButton));
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Math'), findsOneWidget);
    expect(find.text('Science'), findsOneWidget);

    // Select a subject
    await tester.tap(find.text('Math').last);
    await tester.pumpAndSettle();

    // Verify that the selected subject is displayed
    expect(find.text('Math'), findsOneWidget);
  });

  testWidgets('Material list is displayed when a subject is selected', (WidgetTester tester) async {
    // Arrange
    when(() => mockSubjectCubit.state).thenReturn(SubjectState(subjectList: [
      SubjectEntity(name: 'Math'),
      SubjectEntity(name: 'Science'),
    ]));
    when(() => mockMaterialsCubit.state).thenReturn(MaterialsState(materialList: [
      MaterialEntity(
        title: 'Algebra',
        subject: 'Math',
        faculty: 'Dr. Smith',
        createdAt: DateTime.now().toString(),
      ),
    ]));

    // Act
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<SubjectCubit>.value(value: mockSubjectCubit),
          BlocProvider<MaterialsCubit>.value(value: mockMaterialsCubit),
        ],
        child: const MaterialApp(
          home: StudentMaterials(),
        ),
      ),
    );

    // Tap on the dropdown button and select a subject
    await tester.tap(find.byType(KDropdownButton));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Math').last);
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Algebra'), findsOneWidget);
    expect(find.text('Math - Dr. Smith'), findsOneWidget);
  });
}
