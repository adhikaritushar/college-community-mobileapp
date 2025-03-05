// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timetable_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimetableState {
  bool get isLoadingState => throw _privateConstructorUsedError;
  bool get isSuccessState => throw _privateConstructorUsedError;
  AppErrorHandler? get errorState => throw _privateConstructorUsedError;
  List<TimetableEntity> get timetableList => throw _privateConstructorUsedError;

  /// Create a copy of TimetableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimetableStateCopyWith<TimetableState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableStateCopyWith<$Res> {
  factory $TimetableStateCopyWith(
          TimetableState value, $Res Function(TimetableState) then) =
      _$TimetableStateCopyWithImpl<$Res, TimetableState>;
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      AppErrorHandler? errorState,
      List<TimetableEntity> timetableList});
}

/// @nodoc
class _$TimetableStateCopyWithImpl<$Res, $Val extends TimetableState>
    implements $TimetableStateCopyWith<$Res> {
  _$TimetableStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimetableState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? timetableList = null,
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
      timetableList: null == timetableList
          ? _value.timetableList
          : timetableList // ignore: cast_nullable_to_non_nullable
              as List<TimetableEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectStateImplCopyWith<$Res>
    implements $TimetableStateCopyWith<$Res> {
  factory _$$SubjectStateImplCopyWith(
          _$SubjectStateImpl value, $Res Function(_$SubjectStateImpl) then) =
      __$$SubjectStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      AppErrorHandler? errorState,
      List<TimetableEntity> timetableList});
}

/// @nodoc
class __$$SubjectStateImplCopyWithImpl<$Res>
    extends _$TimetableStateCopyWithImpl<$Res, _$SubjectStateImpl>
    implements _$$SubjectStateImplCopyWith<$Res> {
  __$$SubjectStateImplCopyWithImpl(
      _$SubjectStateImpl _value, $Res Function(_$SubjectStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimetableState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? timetableList = null,
  }) {
    return _then(_$SubjectStateImpl(
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
      timetableList: null == timetableList
          ? _value._timetableList
          : timetableList // ignore: cast_nullable_to_non_nullable
              as List<TimetableEntity>,
    ));
  }
}

/// @nodoc

class _$SubjectStateImpl implements _SubjectState {
  const _$SubjectStateImpl(
      {this.isLoadingState = false,
      this.isSuccessState = false,
      this.errorState,
      final List<TimetableEntity> timetableList = const []})
      : _timetableList = timetableList;

  @override
  @JsonKey()
  final bool isLoadingState;
  @override
  @JsonKey()
  final bool isSuccessState;
  @override
  final AppErrorHandler? errorState;
  final List<TimetableEntity> _timetableList;
  @override
  @JsonKey()
  List<TimetableEntity> get timetableList {
    if (_timetableList is EqualUnmodifiableListView) return _timetableList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timetableList);
  }

  @override
  String toString() {
    return 'TimetableState(isLoadingState: $isLoadingState, isSuccessState: $isSuccessState, errorState: $errorState, timetableList: $timetableList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectStateImpl &&
            (identical(other.isLoadingState, isLoadingState) ||
                other.isLoadingState == isLoadingState) &&
            (identical(other.isSuccessState, isSuccessState) ||
                other.isSuccessState == isSuccessState) &&
            (identical(other.errorState, errorState) ||
                other.errorState == errorState) &&
            const DeepCollectionEquality()
                .equals(other._timetableList, _timetableList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoadingState, isSuccessState,
      errorState, const DeepCollectionEquality().hash(_timetableList));

  /// Create a copy of TimetableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectStateImplCopyWith<_$SubjectStateImpl> get copyWith =>
      __$$SubjectStateImplCopyWithImpl<_$SubjectStateImpl>(this, _$identity);
}

abstract class _SubjectState implements TimetableState {
  const factory _SubjectState(
      {final bool isLoadingState,
      final bool isSuccessState,
      final AppErrorHandler? errorState,
      final List<TimetableEntity> timetableList}) = _$SubjectStateImpl;

  @override
  bool get isLoadingState;
  @override
  bool get isSuccessState;
  @override
  AppErrorHandler? get errorState;
  @override
  List<TimetableEntity> get timetableList;

  /// Create a copy of TimetableState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectStateImplCopyWith<_$SubjectStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
