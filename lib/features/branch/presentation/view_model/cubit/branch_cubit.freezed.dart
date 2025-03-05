// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BranchState {
  bool get isLoadingState => throw _privateConstructorUsedError;
  bool get isSuccessState => throw _privateConstructorUsedError;
  AppErrorHandler? get errorState => throw _privateConstructorUsedError;
  List<BranchEntity> get branchList => throw _privateConstructorUsedError;

  /// Create a copy of BranchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BranchStateCopyWith<BranchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchStateCopyWith<$Res> {
  factory $BranchStateCopyWith(
          BranchState value, $Res Function(BranchState) then) =
      _$BranchStateCopyWithImpl<$Res, BranchState>;
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      AppErrorHandler? errorState,
      List<BranchEntity> branchList});
}

/// @nodoc
class _$BranchStateCopyWithImpl<$Res, $Val extends BranchState>
    implements $BranchStateCopyWith<$Res> {
  _$BranchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BranchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? branchList = null,
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
      branchList: null == branchList
          ? _value.branchList
          : branchList // ignore: cast_nullable_to_non_nullable
              as List<BranchEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BranchStateImplCopyWith<$Res>
    implements $BranchStateCopyWith<$Res> {
  factory _$$BranchStateImplCopyWith(
          _$BranchStateImpl value, $Res Function(_$BranchStateImpl) then) =
      __$$BranchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      AppErrorHandler? errorState,
      List<BranchEntity> branchList});
}

/// @nodoc
class __$$BranchStateImplCopyWithImpl<$Res>
    extends _$BranchStateCopyWithImpl<$Res, _$BranchStateImpl>
    implements _$$BranchStateImplCopyWith<$Res> {
  __$$BranchStateImplCopyWithImpl(
      _$BranchStateImpl _value, $Res Function(_$BranchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? branchList = null,
  }) {
    return _then(_$BranchStateImpl(
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
      branchList: null == branchList
          ? _value._branchList
          : branchList // ignore: cast_nullable_to_non_nullable
              as List<BranchEntity>,
    ));
  }
}

/// @nodoc

class _$BranchStateImpl implements _BranchState {
  const _$BranchStateImpl(
      {this.isLoadingState = false,
      this.isSuccessState = false,
      this.errorState,
      final List<BranchEntity> branchList = const []})
      : _branchList = branchList;

  @override
  @JsonKey()
  final bool isLoadingState;
  @override
  @JsonKey()
  final bool isSuccessState;
  @override
  final AppErrorHandler? errorState;
  final List<BranchEntity> _branchList;
  @override
  @JsonKey()
  List<BranchEntity> get branchList {
    if (_branchList is EqualUnmodifiableListView) return _branchList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_branchList);
  }

  @override
  String toString() {
    return 'BranchState(isLoadingState: $isLoadingState, isSuccessState: $isSuccessState, errorState: $errorState, branchList: $branchList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchStateImpl &&
            (identical(other.isLoadingState, isLoadingState) ||
                other.isLoadingState == isLoadingState) &&
            (identical(other.isSuccessState, isSuccessState) ||
                other.isSuccessState == isSuccessState) &&
            (identical(other.errorState, errorState) ||
                other.errorState == errorState) &&
            const DeepCollectionEquality()
                .equals(other._branchList, _branchList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoadingState, isSuccessState,
      errorState, const DeepCollectionEquality().hash(_branchList));

  /// Create a copy of BranchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchStateImplCopyWith<_$BranchStateImpl> get copyWith =>
      __$$BranchStateImplCopyWithImpl<_$BranchStateImpl>(this, _$identity);
}

abstract class _BranchState implements BranchState {
  const factory _BranchState(
      {final bool isLoadingState,
      final bool isSuccessState,
      final AppErrorHandler? errorState,
      final List<BranchEntity> branchList}) = _$BranchStateImpl;

  @override
  bool get isLoadingState;
  @override
  bool get isSuccessState;
  @override
  AppErrorHandler? get errorState;
  @override
  List<BranchEntity> get branchList;

  /// Create a copy of BranchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BranchStateImplCopyWith<_$BranchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
