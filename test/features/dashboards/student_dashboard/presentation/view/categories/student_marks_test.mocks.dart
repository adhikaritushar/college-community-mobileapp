// Mocks generated by Mockito 5.4.4 from annotations
// in college_community/test/features/dashboards/student_dashboard/presentation/view/categories/student_marks_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;

import 'package:college_community/features/auth/domain/entities/request/login_params.dart'
    as _i13;
import 'package:college_community/features/marks/domain/entity/request/add_marks_params.dart'
    as _i15;
import 'package:college_community/features/marks/domain/usecase/add_marks_usecase.dart'
    as _i8;
import 'package:college_community/features/marks/domain/usecase/get_marks_usecase.dart'
    as _i7;
import 'package:college_community/features/marks/presentation/view_model.dart/cubit/marks_cubit.dart'
    as _i9;
import 'package:college_community/features/student/domain/entity/reqeust/student_add_details_faculty_params.dart'
    as _i11;
import 'package:college_community/features/student/domain/usecase/register_student_usecase.dart'
    as _i3;
import 'package:college_community/features/student/domain/usecase/student_add_detail_usecase.dart'
    as _i4;
import 'package:college_community/features/student/domain/usecase/student_get_detail_usecase.dart'
    as _i2;
import 'package:college_community/features/student/domain/usecase/update_student_usecase.dart'
    as _i5;
import 'package:college_community/features/student/presentation/view_model/cubit/student_cubit.dart'
    as _i6;
import 'package:flutter/material.dart' as _i12;
import 'package:flutter_bloc/flutter_bloc.dart' as _i14;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeStudentGetDetailUsecase_0 extends _i1.SmartFake
    implements _i2.StudentGetDetailUsecase {
  _FakeStudentGetDetailUsecase_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRegisterStudentUsecase_1 extends _i1.SmartFake
    implements _i3.RegisterStudentUsecase {
  _FakeRegisterStudentUsecase_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStudentAddDetailUsecase_2 extends _i1.SmartFake
    implements _i4.StudentAddDetailUsecase {
  _FakeStudentAddDetailUsecase_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUpdateStudentUsecase_3 extends _i1.SmartFake
    implements _i5.UpdateStudentUsecase {
  _FakeUpdateStudentUsecase_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStudentState_4 extends _i1.SmartFake implements _i6.StudentState {
  _FakeStudentState_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetMarksUsecase_5 extends _i1.SmartFake
    implements _i7.GetMarksUsecase {
  _FakeGetMarksUsecase_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddMarksUsecase_6 extends _i1.SmartFake
    implements _i8.AddMarksUsecase {
  _FakeAddMarksUsecase_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMarksState_7 extends _i1.SmartFake implements _i9.MarksState {
  _FakeMarksState_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [StudentCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockStudentCubit extends _i1.Mock implements _i6.StudentCubit {
  MockStudentCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.StudentGetDetailUsecase get studentGetDetailUsecase =>
      (super.noSuchMethod(
        Invocation.getter(#studentGetDetailUsecase),
        returnValue: _FakeStudentGetDetailUsecase_0(
          this,
          Invocation.getter(#studentGetDetailUsecase),
        ),
      ) as _i2.StudentGetDetailUsecase);

  @override
  _i3.RegisterStudentUsecase get registerStudentUsecase => (super.noSuchMethod(
        Invocation.getter(#registerStudentUsecase),
        returnValue: _FakeRegisterStudentUsecase_1(
          this,
          Invocation.getter(#registerStudentUsecase),
        ),
      ) as _i3.RegisterStudentUsecase);

  @override
  _i4.StudentAddDetailUsecase get studentAddDetailUsecase =>
      (super.noSuchMethod(
        Invocation.getter(#studentAddDetailUsecase),
        returnValue: _FakeStudentAddDetailUsecase_2(
          this,
          Invocation.getter(#studentAddDetailUsecase),
        ),
      ) as _i4.StudentAddDetailUsecase);

  @override
  _i5.UpdateStudentUsecase get updateStudentUsecase => (super.noSuchMethod(
        Invocation.getter(#updateStudentUsecase),
        returnValue: _FakeUpdateStudentUsecase_3(
          this,
          Invocation.getter(#updateStudentUsecase),
        ),
      ) as _i5.UpdateStudentUsecase);

  @override
  _i6.StudentState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeStudentState_4(
          this,
          Invocation.getter(#state),
        ),
      ) as _i6.StudentState);

  @override
  _i10.Stream<_i6.StudentState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i10.Stream<_i6.StudentState>.empty(),
      ) as _i10.Stream<_i6.StudentState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void studentGetDetials({
    required _i11.StudentGetDetilsParams? params,
    required _i12.BuildContext? context,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #studentGetDetials,
          [],
          {
            #params: params,
            #context: context,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void studentAddDetials({
    required _i11.StudentAddDetailParams? params,
    required _i12.BuildContext? context,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #studentAddDetials,
          [],
          {
            #params: params,
            #context: context,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void registerStudent({
    required _i13.LoginParams? params,
    required _i12.BuildContext? context,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerStudent,
          [],
          {
            #params: params,
            #context: context,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void updateStudent({
    required _i11.StudentAddDetailParams? params,
    required _i12.BuildContext? context,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #updateStudent,
          [],
          {
            #params: params,
            #context: context,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i6.StudentState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i14.Change<_i6.StudentState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i10.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
}

/// A class which mocks [MarksCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockMarksCubit extends _i1.Mock implements _i9.MarksCubit {
  MockMarksCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.GetMarksUsecase get getMarksUsecase => (super.noSuchMethod(
        Invocation.getter(#getMarksUsecase),
        returnValue: _FakeGetMarksUsecase_5(
          this,
          Invocation.getter(#getMarksUsecase),
        ),
      ) as _i7.GetMarksUsecase);

  @override
  _i8.AddMarksUsecase get addMarksUsecase => (super.noSuchMethod(
        Invocation.getter(#addMarksUsecase),
        returnValue: _FakeAddMarksUsecase_6(
          this,
          Invocation.getter(#addMarksUsecase),
        ),
      ) as _i8.AddMarksUsecase);

  @override
  _i9.MarksState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeMarksState_7(
          this,
          Invocation.getter(#state),
        ),
      ) as _i9.MarksState);

  @override
  _i10.Stream<_i9.MarksState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i10.Stream<_i9.MarksState>.empty(),
      ) as _i10.Stream<_i9.MarksState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void getMarks({required int? enrollmentNo}) => super.noSuchMethod(
        Invocation.method(
          #getMarks,
          [],
          {#enrollmentNo: enrollmentNo},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addMarks(
    _i12.BuildContext? context, {
    required _i15.AddMarksParams? params,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #addMarks,
          [context],
          {#params: params},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i9.MarksState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i14.Change<_i9.MarksState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i10.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
}
