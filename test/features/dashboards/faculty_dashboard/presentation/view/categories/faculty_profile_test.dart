import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/domain/entity/faculty_user_entity.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/profile/faculty_profile.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view_model/cubit/faculty_dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock FacultyDashboardCubit
class MockFacultyDashboardCubit extends Mock implements FacultyDashboardCubit {}

void main() {
  late MockFacultyDashboardCubit mockFacultyDashboardCubit;

  setUp(() {
    mockFacultyDashboardCubit = MockFacultyDashboardCubit();
  });

  // Helper function to create the widget with a mocked FacultyDashboardCubit
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<FacultyDashboardCubit>.value(
        value: mockFacultyDashboardCubit,
        child: const FacultyProfile(),
      ),
    );
  }

  testWidgets('FacultyProfile renders user information correctly', (WidgetTester tester) async {
    // Arrange
    final mockUser = FacultyUserEntity(
      firstName: 'John',
      lastName: 'Doe',
      employeeId: 1123456,
      post: 'Professor',
      department: 'Computer Science',
      phoneNumber: 9876543210,
      email: 'john.doe@example.com',
      profile: 'profile.jpg',
    );

    when(() => mockFacultyDashboardCubit.state).thenReturn(FacultyDashboardState(userData: [mockUser]));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('123456'), findsOneWidget);
    expect(find.text('Professor'), findsOneWidget);
    expect(find.text('Computer Science'), findsOneWidget);
    expect(find.text('9876543210'), findsOneWidget);
    expect(find.text('john.doe@example.com'), findsOneWidget);

    // Verify profile picture
    final profileImage = tester.widget<Container>(find.byType(Container).at(1));
    final decoration = profileImage.decoration as BoxDecoration;
    final image = decoration.image as DecorationImage;
    expect(image.image, isA<NetworkImage>());
    expect((image.image as NetworkImage).url, endsWith('profile.jpg'));
  });

  testWidgets('FacultyProfile shows loading indicator when state is loading', (WidgetTester tester) async {
    // Arrange
    when(() => mockFacultyDashboardCubit.state).thenReturn(const FacultyDashboardState(isLoadingState: true));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('FacultyProfile shows error message when state has an error', (WidgetTester tester) async {
    // Arrange
    when(() => mockFacultyDashboardCubit.state).thenReturn(FacultyDashboardState(errorState: AppErrorHandler(message: 'Failed to load data')));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.text('Failed to load data'), findsOneWidget);
  });
}
