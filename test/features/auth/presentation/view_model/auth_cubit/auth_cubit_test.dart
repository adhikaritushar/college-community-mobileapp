import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:college_community/features/auth/domain/entities/response/login_response_entity.dart';
import 'package:college_community/features/auth/domain/usecase/admin_change_password_usecase.dart';
import 'package:college_community/features/auth/domain/usecase/admin_login_usecase.dart';
import 'package:college_community/features/auth/domain/usecase/faculty_change_password_usecase.dart';
import 'package:college_community/features/auth/domain/usecase/faculty_login_usecase.dart';
import 'package:college_community/features/auth/domain/usecase/student_change_password_usecase.dart';
import 'package:college_community/features/auth/domain/usecase/student_login_usecase.dart';
import 'package:college_community/features/auth/presentation/helpers/auth_helper.dart';
import 'package:college_community/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Mock the use cases
class MockAdminLoginUsecase extends Mock implements AdminLoginUsecase {}

class MockStudentLoginUsecase extends Mock implements StudentLoginUsecase {}

class MockFacultyLoginUsecase extends Mock implements FacultyLoginUsecase {}

class MockAdminChangePasswordUsecase extends Mock implements AdminChangePasswordUsecase {}

class MockFacultyChangePasswordUsecase extends Mock implements FacultyChangePasswordUsecase {}

class MockStudentChangePasswordUsecase extends Mock implements StudentChangePasswordUsecase {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late AuthCubit authCubit;
  late MockAdminLoginUsecase mockAdminLoginUsecase;
  late MockStudentLoginUsecase mockStudentLoginUsecase;
  late MockFacultyLoginUsecase mockFacultyLoginUsecase;
  late MockAdminChangePasswordUsecase mockAdminChangePasswordUsecase;
  late MockFacultyChangePasswordUsecase mockFacultyChangePasswordUsecase;
  late MockStudentChangePasswordUsecase mockStudentChangePasswordUsecase;

  setUp(() {
    mockAdminLoginUsecase = MockAdminLoginUsecase();
    mockStudentLoginUsecase = MockStudentLoginUsecase();
    mockFacultyLoginUsecase = MockFacultyLoginUsecase();
    mockAdminChangePasswordUsecase = MockAdminChangePasswordUsecase();
    mockFacultyChangePasswordUsecase = MockFacultyChangePasswordUsecase();
    mockStudentChangePasswordUsecase = MockStudentChangePasswordUsecase();

    authCubit = AuthCubit(
      adminLoginUsecase: mockAdminLoginUsecase,
      studentLoginUsecase: mockStudentLoginUsecase,
      facultyLoginUsecase: mockFacultyLoginUsecase,
      adminChangePasswordUsecase: mockAdminChangePasswordUsecase,
      facultyChangePasswordUsecase: mockFacultyChangePasswordUsecase,
      studentChangePasswordUsecase: mockStudentChangePasswordUsecase,
    );
  });

  tearDown(() {
    authCubit.close();
  });

  group('AuthCubit', () {
    test('initial state is AuthState.initially()', () {
      expect(authCubit.state, AuthState.initially());
    });

    test('selectedCategory updates the state correctly', () {
      const category = AuthHelper.admin;
      authCubit.selectedCategory(category: category);
      expect(authCubit.state.selectedCategory, category);
    });

    group('loginDashBoard', () {
      const loginID = 'test@example.com';
      const password = 'password123';
      final tLoginParams = LoginParams(loginID: loginID, password: password);

      test('calls adminLogin when selectedCategory is admin', () async {
        // Arrange
        authCubit.selectedCategory(category: AuthHelper.admin);
        when(mockAdminLoginUsecase.call(tLoginParams)).thenAnswer((_) async => Right(LoginResponseEntity(message: 'Login successful')));

        // Act
        await authCubit.loginDashBoard(loginID: loginID, password: password, context: MockBuildContext());

        // Assert
        verify(mockAdminLoginUsecase.call(tLoginParams)).called(1);
      });

      test('calls studentLogin when selectedCategory is student', () async {
        // Arrange
        authCubit.selectedCategory(category: AuthHelper.student);
        when(mockStudentLoginUsecase.call(tLoginParams)).thenAnswer((_) async => Right(LoginResponseEntity(message: 'Login successful')));

        // Act
        await authCubit.loginDashBoard(loginID: loginID, password: password, context: MockBuildContext());

        // Assert
        verify(mockStudentLoginUsecase.call(tLoginParams)).called(1);
      });

      test('calls facultyLogin when selectedCategory is faculty', () async {
        // Arrange
        authCubit.selectedCategory(category: AuthHelper.faculty);
        when(mockFacultyLoginUsecase.call(tLoginParams)).thenAnswer((_) async => Right(LoginResponseEntity(message: 'Login successful')));

        // Act
        await authCubit.loginDashBoard(loginID: loginID, password: password, context: MockBuildContext());

        // Assert
        verify(mockFacultyLoginUsecase.call(tLoginParams)).called(1);
      });
    });

    group('adminLogin', () {
      const loginID = 'admin@example.com';
      const password = 'admin123';
      final tLoginParams = LoginParams(loginID: loginID, password: password);

      test('emits loading and success states when login is successful', () async {
        // Arrange
        when(mockAdminLoginUsecase.call(tLoginParams)).thenAnswer((_) async => Right(LoginResponseEntity(message: 'Login successful')));

        // Act
        authCubit.adminLogin(loginID: loginID, password: password, context: MockBuildContext());

        // Assert
        expect(authCubit.state.isLoadingState, true);
        await untilCalled(mockAdminLoginUsecase.call(tLoginParams));
        expect(authCubit.state.isLoadingState, false);
        expect(authCubit.state.isSuccessState, true);
      });

      test('emits loading and error states when login fails', () async {
        // Arrange
        final tError = AppErrorHandler(message: 'Login failed');
        when(mockAdminLoginUsecase.call(tLoginParams)).thenAnswer((_) async => Left(tError));

        // Act
        authCubit.adminLogin(loginID: loginID, password: password, context: MockBuildContext());

        // Assert
        expect(authCubit.state.isLoadingState, true);
        await untilCalled(mockAdminLoginUsecase.call(tLoginParams));
        expect(authCubit.state.isLoadingState, false);
        expect(authCubit.state.errorState, tError);
      });
    });

    group('studentLogin', () {
      const loginID = 'student@example.com';
      const password = 'student123';
      final tLoginParams = LoginParams(loginID: loginID, password: password);

      test('emits loading and success states when login is successful', () async {
        // Arrange
        when(mockStudentLoginUsecase.call(tLoginParams)).thenAnswer((_) async => Right(LoginResponseEntity(message: 'Login successful')));

        // Act
        authCubit.studentLogin(loginID: loginID, password: password, context: MockBuildContext());

        // Assert
        expect(authCubit.state.isLoadingState, true);
        await untilCalled(mockStudentLoginUsecase.call(tLoginParams));
        expect(authCubit.state.isLoadingState, false);
        expect(authCubit.state.isSuccessState, true);
      });

      test('emits loading and error states when login fails', () async {
        // Arrange
        final tError = AppErrorHandler(message: 'Login failed');
        when(mockStudentLoginUsecase.call(tLoginParams)).thenAnswer((_) async => Left(tError));

        // Act
        authCubit.studentLogin(loginID: loginID, password: password, context: MockBuildContext());

        // Assert
        expect(authCubit.state.isLoadingState, true);
        await untilCalled(mockStudentLoginUsecase.call(tLoginParams));
        expect(authCubit.state.isLoadingState, false);
        expect(authCubit.state.errorState, tError);
      });
    });

    group('facultyLogin', () {
      const loginID = 'faculty@example.com';
      const password = 'faculty123';
      final tLoginParams = LoginParams(loginID: loginID, password: password);

      test('emits loading and success states when login is successful', () async {
        // Arrange
        when(mockFacultyLoginUsecase.call(tLoginParams)).thenAnswer((_) async => Right(LoginResponseEntity(message: 'Login successful')));

        // Act
        authCubit.facultyLogin(loginID: loginID, password: password, context: MockBuildContext());

        // Assert
        expect(authCubit.state.isLoadingState, true);
        await untilCalled(mockFacultyLoginUsecase.call(tLoginParams));
        expect(authCubit.state.isLoadingState, false);
        expect(authCubit.state.isSuccessState, true);
      });

      test('emits loading and error states when login fails', () async {
        // Arrange
        final tError = AppErrorHandler(message: 'Login failed');
        when(mockFacultyLoginUsecase.call(tLoginParams)).thenAnswer((_) async => Left(tError));

        // Act
        authCubit.facultyLogin(loginID: loginID, password: password, context: MockBuildContext());

        // Assert
        expect(authCubit.state.isLoadingState, true);
        await untilCalled(mockFacultyLoginUsecase.call(tLoginParams));
        expect(authCubit.state.isLoadingState, false);
        expect(authCubit.state.errorState, tError);
      });
    });

    group('adminChangePassword', () {
      final tChangePasswordParams = LoginParams(loginID: 'admin@example.com', password: 'newpassword123');

      test('emits loading and success states when password change is successful', () async {
        // Arrange
        when(mockAdminChangePasswordUsecase.call(tChangePasswordParams)).thenAnswer((_) async => const Right('Password changed successfully'));

        // Act
        authCubit.adminChangePassword(changePasswrod: tChangePasswordParams, context: MockBuildContext());

        // Assert
        expect(authCubit.state.isLoadingState, true);
        await untilCalled(mockAdminChangePasswordUsecase.call(tChangePasswordParams));
        expect(authCubit.state.isLoadingState, false);
        expect(authCubit.state.isSuccessState, true);
      });

      test('emits loading and error states when password change fails', () async {
        // Arrange
        final tError = AppErrorHandler(message: 'Password change failed');
        when(mockAdminChangePasswordUsecase.call(tChangePasswordParams)).thenAnswer((_) async => Left(tError));

        // Act
        authCubit.adminChangePassword(changePasswrod: tChangePasswordParams, context: MockBuildContext());

        // Assert
        expect(authCubit.state.isLoadingState, true);
        await untilCalled(mockAdminChangePasswordUsecase.call(tChangePasswordParams));
        expect(authCubit.state.isLoadingState, false);
        expect(authCubit.state.errorState, tError);
      });
    });

    group('facultyChangePassword', () {
      final tChangePasswordParams = LoginParams(loginID: 'faculty@example.com', password: 'newpassword123');

      test('emits loading and success states when password change is successful', () async {
        // Arrange
        when(mockFacultyChangePasswordUsecase.call(tChangePasswordParams)).thenAnswer((_) async => const Right('Password changed successfully'));

        // Act
        authCubit.facultyChangePassword(changePasswrod: tChangePasswordParams, context: MockBuildContext());

        // Assert
        expect(authCubit.state.isLoadingState, true);
        await untilCalled(mockFacultyChangePasswordUsecase.call(tChangePasswordParams));
        expect(authCubit.state.isLoadingState, false);
        expect(authCubit.state.isSuccessState, true);
      });

      test('emits loading and error states when password change fails', () async {
        // Arrange
        final tError = AppErrorHandler(message: 'Password change failed');
        when(mockFacultyChangePasswordUsecase.call(tChangePasswordParams)).thenAnswer((_) async => Left(tError));

        // Act
        authCubit.facultyChangePassword(changePasswrod: tChangePasswordParams, context: MockBuildContext());

        // Assert
        expect(authCubit.state.isLoadingState, true);
        await untilCalled(mockFacultyChangePasswordUsecase.call(tChangePasswordParams));
        expect(authCubit.state.isLoadingState, false);
        expect(authCubit.state.errorState, tError);
      });
    });

    group('studentChangePassword', () {
      final tChangePasswordParams = LoginParams(loginID: 'student@example.com', password: 'newpassword123');

      test('emits loading and success states when password change is successful', () async {
        // Arrange
        when(mockStudentChangePasswordUsecase.call(tChangePasswordParams)).thenAnswer((_) async => const Right('Password changed successfully'));

        // Act
        authCubit.studentChangePassword(changePasswrod: tChangePasswordParams, context: MockBuildContext());

        // Assert
        expect(authCubit.state.isLoadingState, true);
        await untilCalled(mockStudentChangePasswordUsecase.call(tChangePasswordParams));
        expect(authCubit.state.isLoadingState, false);
        expect(authCubit.state.isSuccessState, true);
      });

      test('emits loading and error states when password change fails', () async {
        // Arrange
        final tError = AppErrorHandler(message: 'Password change failed');
        when(mockStudentChangePasswordUsecase.call(tChangePasswordParams)).thenAnswer((_) async => Left(tError));

        // Act
        authCubit.studentChangePassword(changePasswrod: tChangePasswordParams, context: MockBuildContext());

        // Assert
        expect(authCubit.state.isLoadingState, true);
        await untilCalled(mockStudentChangePasswordUsecase.call(tChangePasswordParams));
        expect(authCubit.state.isLoadingState, false);
        expect(authCubit.state.errorState, tError);
      });
    });
  });
}
