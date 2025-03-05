// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StudentState {
  bool get isLoadingState => throw _privateConstructorUsedError;
  bool get isSuccessState => throw _privateConstructorUsedError;
  AppErrorHandler? get errorState => throw _privateConstructorUsedError;
  String get genderSelect => throw _privateConstructorUsedError;
  List<StudentEntity> get studentData => throw _privateConstructorUsedError;

  /// Create a copy of StudentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentStateCopyWith<StudentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentStateCopyWith<$Res> {
  factory $StudentStateCopyWith(
          StudentState value, $Res Function(StudentState) then) =
      _$StudentStateCopyWithImpl<$Res, StudentState>;
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      AppErrorHandler? errorState,
      String genderSelect,
      List<StudentEntity> studentData});
}

/// @nodoc
class _$StudentStateCopyWithImpl<$Res, $Val extends StudentState>
    implements $StudentStateCopyWith<$Res> {
  _$StudentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? genderSelect = null,
    Object? studentData = null,
  }) {
    return _then(_value.copyWith(
      isLoadingState: null == isLoadingState
          ? _value.isLoadingState
          : isLoadingState // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessState: null == isSuccessState
          ? _value.isSuccessState
          : isSuccessState // ignore: cast_nullable_to_non_nullable
              as bool,
      errorState: freezed == errorState
          ? _value.errorState
          : errorState // ignore: cast_nullable_to_non_nullable
              as AppErrorHandler?,
      genderSelect: null == genderSelect
          ? _value.genderSelect
          : genderSelect // ignore: cast_nullable_to_non_nullable
              as String,
      studentData: null == studentData
          ? _value.studentData
          : studentData // ignore: cast_nullable_to_non_nullable
              as List<StudentEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentStateImplCopyWith<$Res>
    implements $StudentStateCopyWith<$Res> {
  factory _$$StudentStateImplCopyWith(
          _$StudentStateImpl value, $Res Function(_$StudentStateImpl) then) =
      __$$StudentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      AppErrorHandler? errorState,
      String genderSelect,
      List<StudentEntity> studentData});
}

/// @nodoc
class __$$StudentStateImplCopyWithImpl<$Res>
    extends _$StudentStateCopyWithImpl<$Res, _$StudentStateImpl>
    implements _$$StudentStateImplCopyWith<$Res> {
  __$$StudentStateImplCopyWithImpl(
      _$StudentStateImpl _value, $Res Function(_$StudentStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? genderSelect = null,
    Object? studentData = null,
  }) {
    return _then(_$StudentStateImpl(
      isLoadingState: null == isLoadingState
          ? _value.isLoadingState
          : isLoadingState // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessState: null == isSuccessState
          ? _value.isSuccessState
          : isSuccessState // ignore: cast_nullable_to_non_nullable
              as bool,
      errorState: freezed == errorState
          ? _value.errorState
          : errorState // ignore: cast_nullable_to_non_nullable
              as AppErrorHandler?,
      genderSelect: null == genderSelect
          ? _value.genderSelect
          : genderSelect // ignore: cast_nullable_to_non_nullable
              as String,
      studentData: null == studentData
          ? _value._studentData
          : studentData // ignore: cast_nullable_to_non_nullable
              as List<StudentEntity>,
    ));
  }
}

/// @nodoc

class _$StudentStateImpl implements _StudentState {
  const _$StudentStateImpl(
      {this.isLoadingState = false,
      this.isSuccessState = false,
      this.errorState,
      this.genderSelect = "",
      final List<StudentEntity> studentData = const []})
      : _studentData = studentData;

  @override
  @JsonKey()
  final bool isLoadingState;
  @override
  @JsonKey()
  final bool isSuccessState;
  @override
  final AppErrorHandler? errorState;
  @override
  @JsonKey()
  final String genderSelect;
  final List<StudentEntity> _studentData;
  @override
  @JsonKey()
  List<StudentEntity> get studentData {
    if (_studentData is EqualUnmodifiableListView) return _studentData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_studentData);
  }

  @override
  String toString() {
    return 'StudentState(isLoadingState: $isLoadingState, isSuccessState: $isSuccessState, errorState: $errorState, genderSelect: $genderSelect, studentData: $studentData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentStateImpl &&
            (identical(other.isLoadingState, isLoadingState) ||
                other.isLoadingState == isLoadingState) &&
            (identical(other.isSuccessState, isSuccessState) ||
                other.isSuccessState == isSuccessState) &&
            (identical(other.errorState, errorState) ||
                other.errorState == errorState) &&
            (identical(other.genderSelect, genderSelect) ||
                other.genderSelect == genderSelect) &&
            const DeepCollectionEquality()
                .equals(other._studentData, _studentData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingState,
      isSuccessState,
      errorState,
      genderSelect,
      const DeepCollectionEquality().hash(_studentData));

  /// Create a copy of StudentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentStateImplCopyWith<_$StudentStateImpl> get copyWith =>
      __$$StudentStateImplCopyWithImpl<_$StudentStateImpl>(this, _$identity);
}

abstract class _StudentState implements StudentState {
  const factory _StudentState(
      {final bool isLoadingState,
      final bool isSuccessState,
      final AppErrorHandler? errorState,
      final String genderSelect,
      final List<StudentEntity> studentData}) = _$StudentStateImpl;

  @override
  bool get isLoadingState;
  @override
  bool get isSuccessState;
  @override
  AppErrorHandler? get errorState;
  @override
  String get genderSelect;
  @override
  List<StudentEntity> get studentData;

  /// Create a copy of StudentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentStateImplCopyWith<_$StudentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
