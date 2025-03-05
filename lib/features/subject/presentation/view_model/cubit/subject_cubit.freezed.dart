// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubjectState {
  bool get isLoadingState => throw _privateConstructorUsedError;
  bool get isSuccessState => throw _privateConstructorUsedError;
  AppErrorHandler? get errorState => throw _privateConstructorUsedError;
  List<SubjectEntity> get subjectList => throw _privateConstructorUsedError;

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectStateCopyWith<SubjectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectStateCopyWith<$Res> {
  factory $SubjectStateCopyWith(
          SubjectState value, $Res Function(SubjectState) then) =
      _$SubjectStateCopyWithImpl<$Res, SubjectState>;
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      AppErrorHandler? errorState,
      List<SubjectEntity> subjectList});
}

/// @nodoc
class _$SubjectStateCopyWithImpl<$Res, $Val extends SubjectState>
    implements $SubjectStateCopyWith<$Res> {
  _$SubjectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? subjectList = null,
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
      subjectList: null == subjectList
          ? _value.subjectList
          : subjectList // ignore: cast_nullable_to_non_nullable
              as List<SubjectEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectStateImplCopyWith<$Res>
    implements $SubjectStateCopyWith<$Res> {
  factory _$$SubjectStateImplCopyWith(
          _$SubjectStateImpl value, $Res Function(_$SubjectStateImpl) then) =
      __$$SubjectStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      AppErrorHandler? errorState,
      List<SubjectEntity> subjectList});
}

/// @nodoc
class __$$SubjectStateImplCopyWithImpl<$Res>
    extends _$SubjectStateCopyWithImpl<$Res, _$SubjectStateImpl>
    implements _$$SubjectStateImplCopyWith<$Res> {
  __$$SubjectStateImplCopyWithImpl(
      _$SubjectStateImpl _value, $Res Function(_$SubjectStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? subjectList = null,
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
      subjectList: null == subjectList
          ? _value._subjectList
          : subjectList // ignore: cast_nullable_to_non_nullable
              as List<SubjectEntity>,
    ));
  }
}

/// @nodoc

class _$SubjectStateImpl implements _SubjectState {
  const _$SubjectStateImpl(
      {this.isLoadingState = false,
      this.isSuccessState = false,
      this.errorState,
      final List<SubjectEntity> subjectList = const []})
      : _subjectList = subjectList;

  @override
  @JsonKey()
  final bool isLoadingState;
  @override
  @JsonKey()
  final bool isSuccessState;
  @override
  final AppErrorHandler? errorState;
  final List<SubjectEntity> _subjectList;
  @override
  @JsonKey()
  List<SubjectEntity> get subjectList {
    if (_subjectList is EqualUnmodifiableListView) return _subjectList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjectList);
  }

  @override
  String toString() {
    return 'SubjectState(isLoadingState: $isLoadingState, isSuccessState: $isSuccessState, errorState: $errorState, subjectList: $subjectList)';
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
                .equals(other._subjectList, _subjectList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoadingState, isSuccessState,
      errorState, const DeepCollectionEquality().hash(_subjectList));

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectStateImplCopyWith<_$SubjectStateImpl> get copyWith =>
      __$$SubjectStateImplCopyWithImpl<_$SubjectStateImpl>(this, _$identity);
}

abstract class _SubjectState implements SubjectState {
  const factory _SubjectState(
      {final bool isLoadingState,
      final bool isSuccessState,
      final AppErrorHandler? errorState,
      final List<SubjectEntity> subjectList}) = _$SubjectStateImpl;

  @override
  bool get isLoadingState;
  @override
  bool get isSuccessState;
  @override
  AppErrorHandler? get errorState;
  @override
  List<SubjectEntity> get subjectList;

  /// Create a copy of SubjectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectStateImplCopyWith<_$SubjectStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
