// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faculty_dashboard_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FacultyDashboardState {
  bool get isLoadingState => throw _privateConstructorUsedError;
  bool get isSuccessState => throw _privateConstructorUsedError;
  AppErrorHandler? get errorState => throw _privateConstructorUsedError;
  List<FacultyUserEntity> get userData => throw _privateConstructorUsedError;

  /// Create a copy of FacultyDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FacultyDashboardStateCopyWith<FacultyDashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacultyDashboardStateCopyWith<$Res> {
  factory $FacultyDashboardStateCopyWith(FacultyDashboardState value,
          $Res Function(FacultyDashboardState) then) =
      _$FacultyDashboardStateCopyWithImpl<$Res, FacultyDashboardState>;
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      AppErrorHandler? errorState,
      List<FacultyUserEntity> userData});
}

/// @nodoc
class _$FacultyDashboardStateCopyWithImpl<$Res,
        $Val extends FacultyDashboardState>
    implements $FacultyDashboardStateCopyWith<$Res> {
  _$FacultyDashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FacultyDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? userData = null,
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
      userData: null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as List<FacultyUserEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FacultyDashboardStateImplCopyWith<$Res>
    implements $FacultyDashboardStateCopyWith<$Res> {
  factory _$$FacultyDashboardStateImplCopyWith(
          _$FacultyDashboardStateImpl value,
          $Res Function(_$FacultyDashboardStateImpl) then) =
      __$$FacultyDashboardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      AppErrorHandler? errorState,
      List<FacultyUserEntity> userData});
}

/// @nodoc
class __$$FacultyDashboardStateImplCopyWithImpl<$Res>
    extends _$FacultyDashboardStateCopyWithImpl<$Res,
        _$FacultyDashboardStateImpl>
    implements _$$FacultyDashboardStateImplCopyWith<$Res> {
  __$$FacultyDashboardStateImplCopyWithImpl(_$FacultyDashboardStateImpl _value,
      $Res Function(_$FacultyDashboardStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FacultyDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? userData = null,
  }) {
    return _then(_$FacultyDashboardStateImpl(
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
      userData: null == userData
          ? _value._userData
          : userData // ignore: cast_nullable_to_non_nullable
              as List<FacultyUserEntity>,
    ));
  }
}

/// @nodoc

class _$FacultyDashboardStateImpl implements _FacultyDashboardState {
  const _$FacultyDashboardStateImpl(
      {this.isLoadingState = false,
      this.isSuccessState = false,
      this.errorState,
      final List<FacultyUserEntity> userData = const []})
      : _userData = userData;

  @override
  @JsonKey()
  final bool isLoadingState;
  @override
  @JsonKey()
  final bool isSuccessState;
  @override
  final AppErrorHandler? errorState;
  final List<FacultyUserEntity> _userData;
  @override
  @JsonKey()
  List<FacultyUserEntity> get userData {
    if (_userData is EqualUnmodifiableListView) return _userData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userData);
  }

  @override
  String toString() {
    return 'FacultyDashboardState(isLoadingState: $isLoadingState, isSuccessState: $isSuccessState, errorState: $errorState, userData: $userData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacultyDashboardStateImpl &&
            (identical(other.isLoadingState, isLoadingState) ||
                other.isLoadingState == isLoadingState) &&
            (identical(other.isSuccessState, isSuccessState) ||
                other.isSuccessState == isSuccessState) &&
            (identical(other.errorState, errorState) ||
                other.errorState == errorState) &&
            const DeepCollectionEquality().equals(other._userData, _userData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoadingState, isSuccessState,
      errorState, const DeepCollectionEquality().hash(_userData));

  /// Create a copy of FacultyDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FacultyDashboardStateImplCopyWith<_$FacultyDashboardStateImpl>
      get copyWith => __$$FacultyDashboardStateImplCopyWithImpl<
          _$FacultyDashboardStateImpl>(this, _$identity);
}

abstract class _FacultyDashboardState implements FacultyDashboardState {
  const factory _FacultyDashboardState(
      {final bool isLoadingState,
      final bool isSuccessState,
      final AppErrorHandler? errorState,
      final List<FacultyUserEntity> userData}) = _$FacultyDashboardStateImpl;

  @override
  bool get isLoadingState;
  @override
  bool get isSuccessState;
  @override
  AppErrorHandler? get errorState;
  @override
  List<FacultyUserEntity> get userData;

  /// Create a copy of FacultyDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FacultyDashboardStateImplCopyWith<_$FacultyDashboardStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
