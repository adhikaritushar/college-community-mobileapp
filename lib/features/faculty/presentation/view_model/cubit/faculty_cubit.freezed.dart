// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faculty_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FacultyState {
  bool get isLoadingState => throw _privateConstructorUsedError;
  bool get isSuccessState => throw _privateConstructorUsedError;
  AppErrorHandler? get errorState => throw _privateConstructorUsedError;
  String get genderSelect => throw _privateConstructorUsedError;
  List<FacultyEntity> get facultydata => throw _privateConstructorUsedError;
  FacultyRegisterEntity? get registerResponse =>
      throw _privateConstructorUsedError;

  /// Create a copy of FacultyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FacultyStateCopyWith<FacultyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacultyStateCopyWith<$Res> {
  factory $FacultyStateCopyWith(
          FacultyState value, $Res Function(FacultyState) then) =
      _$FacultyStateCopyWithImpl<$Res, FacultyState>;
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      AppErrorHandler? errorState,
      String genderSelect,
      List<FacultyEntity> facultydata,
      FacultyRegisterEntity? registerResponse});
}

/// @nodoc
class _$FacultyStateCopyWithImpl<$Res, $Val extends FacultyState>
    implements $FacultyStateCopyWith<$Res> {
  _$FacultyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FacultyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? genderSelect = null,
    Object? facultydata = null,
    Object? registerResponse = freezed,
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
      facultydata: null == facultydata
          ? _value.facultydata
          : facultydata // ignore: cast_nullable_to_non_nullable
              as List<FacultyEntity>,
      registerResponse: freezed == registerResponse
          ? _value.registerResponse
          : registerResponse // ignore: cast_nullable_to_non_nullable
              as FacultyRegisterEntity?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FacultyStateImplCopyWith<$Res>
    implements $FacultyStateCopyWith<$Res> {
  factory _$$FacultyStateImplCopyWith(
          _$FacultyStateImpl value, $Res Function(_$FacultyStateImpl) then) =
      __$$FacultyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      AppErrorHandler? errorState,
      String genderSelect,
      List<FacultyEntity> facultydata,
      FacultyRegisterEntity? registerResponse});
}

/// @nodoc
class __$$FacultyStateImplCopyWithImpl<$Res>
    extends _$FacultyStateCopyWithImpl<$Res, _$FacultyStateImpl>
    implements _$$FacultyStateImplCopyWith<$Res> {
  __$$FacultyStateImplCopyWithImpl(
      _$FacultyStateImpl _value, $Res Function(_$FacultyStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FacultyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? genderSelect = null,
    Object? facultydata = null,
    Object? registerResponse = freezed,
  }) {
    return _then(_$FacultyStateImpl(
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
      facultydata: null == facultydata
          ? _value._facultydata
          : facultydata // ignore: cast_nullable_to_non_nullable
              as List<FacultyEntity>,
      registerResponse: freezed == registerResponse
          ? _value.registerResponse
          : registerResponse // ignore: cast_nullable_to_non_nullable
              as FacultyRegisterEntity?,
    ));
  }
}

/// @nodoc

class _$FacultyStateImpl implements _FacultyState {
  const _$FacultyStateImpl(
      {this.isLoadingState = false,
      this.isSuccessState = false,
      this.errorState,
      this.genderSelect = "",
      final List<FacultyEntity> facultydata = const [],
      this.registerResponse})
      : _facultydata = facultydata;

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
  final List<FacultyEntity> _facultydata;
  @override
  @JsonKey()
  List<FacultyEntity> get facultydata {
    if (_facultydata is EqualUnmodifiableListView) return _facultydata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facultydata);
  }

  @override
  final FacultyRegisterEntity? registerResponse;

  @override
  String toString() {
    return 'FacultyState(isLoadingState: $isLoadingState, isSuccessState: $isSuccessState, errorState: $errorState, genderSelect: $genderSelect, facultydata: $facultydata, registerResponse: $registerResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacultyStateImpl &&
            (identical(other.isLoadingState, isLoadingState) ||
                other.isLoadingState == isLoadingState) &&
            (identical(other.isSuccessState, isSuccessState) ||
                other.isSuccessState == isSuccessState) &&
            (identical(other.errorState, errorState) ||
                other.errorState == errorState) &&
            (identical(other.genderSelect, genderSelect) ||
                other.genderSelect == genderSelect) &&
            const DeepCollectionEquality()
                .equals(other._facultydata, _facultydata) &&
            (identical(other.registerResponse, registerResponse) ||
                other.registerResponse == registerResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingState,
      isSuccessState,
      errorState,
      genderSelect,
      const DeepCollectionEquality().hash(_facultydata),
      registerResponse);

  /// Create a copy of FacultyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FacultyStateImplCopyWith<_$FacultyStateImpl> get copyWith =>
      __$$FacultyStateImplCopyWithImpl<_$FacultyStateImpl>(this, _$identity);
}

abstract class _FacultyState implements FacultyState {
  const factory _FacultyState(
      {final bool isLoadingState,
      final bool isSuccessState,
      final AppErrorHandler? errorState,
      final String genderSelect,
      final List<FacultyEntity> facultydata,
      final FacultyRegisterEntity? registerResponse}) = _$FacultyStateImpl;

  @override
  bool get isLoadingState;
  @override
  bool get isSuccessState;
  @override
  AppErrorHandler? get errorState;
  @override
  String get genderSelect;
  @override
  List<FacultyEntity> get facultydata;
  @override
  FacultyRegisterEntity? get registerResponse;

  /// Create a copy of FacultyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FacultyStateImplCopyWith<_$FacultyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
