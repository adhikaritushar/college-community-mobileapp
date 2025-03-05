// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marks_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MarksState {
  bool get isLoadingState => throw _privateConstructorUsedError;
  bool get isSuccessState => throw _privateConstructorUsedError;
  AppErrorHandler? get errorState => throw _privateConstructorUsedError;
  List<MarksEntity> get marksList => throw _privateConstructorUsedError;

  /// Create a copy of MarksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarksStateCopyWith<MarksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarksStateCopyWith<$Res> {
  factory $MarksStateCopyWith(
          MarksState value, $Res Function(MarksState) then) =
      _$MarksStateCopyWithImpl<$Res, MarksState>;
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      AppErrorHandler? errorState,
      List<MarksEntity> marksList});
}

/// @nodoc
class _$MarksStateCopyWithImpl<$Res, $Val extends MarksState>
    implements $MarksStateCopyWith<$Res> {
  _$MarksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? marksList = null,
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
      marksList: null == marksList
          ? _value.marksList
          : marksList // ignore: cast_nullable_to_non_nullable
              as List<MarksEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarksStateImplCopyWith<$Res>
    implements $MarksStateCopyWith<$Res> {
  factory _$$MarksStateImplCopyWith(
          _$MarksStateImpl value, $Res Function(_$MarksStateImpl) then) =
      __$$MarksStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      AppErrorHandler? errorState,
      List<MarksEntity> marksList});
}

/// @nodoc
class __$$MarksStateImplCopyWithImpl<$Res>
    extends _$MarksStateCopyWithImpl<$Res, _$MarksStateImpl>
    implements _$$MarksStateImplCopyWith<$Res> {
  __$$MarksStateImplCopyWithImpl(
      _$MarksStateImpl _value, $Res Function(_$MarksStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MarksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? marksList = null,
  }) {
    return _then(_$MarksStateImpl(
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
      marksList: null == marksList
          ? _value._marksList
          : marksList // ignore: cast_nullable_to_non_nullable
              as List<MarksEntity>,
    ));
  }
}

/// @nodoc

class _$MarksStateImpl implements _MarksState {
  const _$MarksStateImpl(
      {this.isLoadingState = false,
      this.isSuccessState = false,
      this.errorState,
      final List<MarksEntity> marksList = const []})
      : _marksList = marksList;

  @override
  @JsonKey()
  final bool isLoadingState;
  @override
  @JsonKey()
  final bool isSuccessState;
  @override
  final AppErrorHandler? errorState;
  final List<MarksEntity> _marksList;
  @override
  @JsonKey()
  List<MarksEntity> get marksList {
    if (_marksList is EqualUnmodifiableListView) return _marksList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_marksList);
  }

  @override
  String toString() {
    return 'MarksState(isLoadingState: $isLoadingState, isSuccessState: $isSuccessState, errorState: $errorState, marksList: $marksList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarksStateImpl &&
            (identical(other.isLoadingState, isLoadingState) ||
                other.isLoadingState == isLoadingState) &&
            (identical(other.isSuccessState, isSuccessState) ||
                other.isSuccessState == isSuccessState) &&
            (identical(other.errorState, errorState) ||
                other.errorState == errorState) &&
            const DeepCollectionEquality()
                .equals(other._marksList, _marksList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoadingState, isSuccessState,
      errorState, const DeepCollectionEquality().hash(_marksList));

  /// Create a copy of MarksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarksStateImplCopyWith<_$MarksStateImpl> get copyWith =>
      __$$MarksStateImplCopyWithImpl<_$MarksStateImpl>(this, _$identity);
}

abstract class _MarksState implements MarksState {
  const factory _MarksState(
      {final bool isLoadingState,
      final bool isSuccessState,
      final AppErrorHandler? errorState,
      final List<MarksEntity> marksList}) = _$MarksStateImpl;

  @override
  bool get isLoadingState;
  @override
  bool get isSuccessState;
  @override
  AppErrorHandler? get errorState;
  @override
  List<MarksEntity> get marksList;

  /// Create a copy of MarksState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarksStateImplCopyWith<_$MarksStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
