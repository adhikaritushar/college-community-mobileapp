// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaterialsState {
  bool get isLoadingState => throw _privateConstructorUsedError;
  bool get isSuccessState => throw _privateConstructorUsedError;
  AppErrorHandler? get errorState => throw _privateConstructorUsedError;
  List<MaterialEntity> get materialList => throw _privateConstructorUsedError;

  /// Create a copy of MaterialsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialsStateCopyWith<MaterialsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialsStateCopyWith<$Res> {
  factory $MaterialsStateCopyWith(
          MaterialsState value, $Res Function(MaterialsState) then) =
      _$MaterialsStateCopyWithImpl<$Res, MaterialsState>;
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      AppErrorHandler? errorState,
      List<MaterialEntity> materialList});
}

/// @nodoc
class _$MaterialsStateCopyWithImpl<$Res, $Val extends MaterialsState>
    implements $MaterialsStateCopyWith<$Res> {
  _$MaterialsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? materialList = null,
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
      materialList: null == materialList
          ? _value.materialList
          : materialList // ignore: cast_nullable_to_non_nullable
              as List<MaterialEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialsStateImplCopyWith<$Res>
    implements $MaterialsStateCopyWith<$Res> {
  factory _$$MaterialsStateImplCopyWith(_$MaterialsStateImpl value,
          $Res Function(_$MaterialsStateImpl) then) =
      __$$MaterialsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      AppErrorHandler? errorState,
      List<MaterialEntity> materialList});
}

/// @nodoc
class __$$MaterialsStateImplCopyWithImpl<$Res>
    extends _$MaterialsStateCopyWithImpl<$Res, _$MaterialsStateImpl>
    implements _$$MaterialsStateImplCopyWith<$Res> {
  __$$MaterialsStateImplCopyWithImpl(
      _$MaterialsStateImpl _value, $Res Function(_$MaterialsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? materialList = null,
  }) {
    return _then(_$MaterialsStateImpl(
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
      materialList: null == materialList
          ? _value._materialList
          : materialList // ignore: cast_nullable_to_non_nullable
              as List<MaterialEntity>,
    ));
  }
}

/// @nodoc

class _$MaterialsStateImpl implements _MaterialsState {
  const _$MaterialsStateImpl(
      {this.isLoadingState = false,
      this.isSuccessState = false,
      this.errorState,
      final List<MaterialEntity> materialList = const []})
      : _materialList = materialList;

  @override
  @JsonKey()
  final bool isLoadingState;
  @override
  @JsonKey()
  final bool isSuccessState;
  @override
  final AppErrorHandler? errorState;
  final List<MaterialEntity> _materialList;
  @override
  @JsonKey()
  List<MaterialEntity> get materialList {
    if (_materialList is EqualUnmodifiableListView) return _materialList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materialList);
  }

  @override
  String toString() {
    return 'MaterialsState(isLoadingState: $isLoadingState, isSuccessState: $isSuccessState, errorState: $errorState, materialList: $materialList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialsStateImpl &&
            (identical(other.isLoadingState, isLoadingState) ||
                other.isLoadingState == isLoadingState) &&
            (identical(other.isSuccessState, isSuccessState) ||
                other.isSuccessState == isSuccessState) &&
            (identical(other.errorState, errorState) ||
                other.errorState == errorState) &&
            const DeepCollectionEquality()
                .equals(other._materialList, _materialList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoadingState, isSuccessState,
      errorState, const DeepCollectionEquality().hash(_materialList));

  /// Create a copy of MaterialsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialsStateImplCopyWith<_$MaterialsStateImpl> get copyWith =>
      __$$MaterialsStateImplCopyWithImpl<_$MaterialsStateImpl>(
          this, _$identity);
}

abstract class _MaterialsState implements MaterialsState {
  const factory _MaterialsState(
      {final bool isLoadingState,
      final bool isSuccessState,
      final AppErrorHandler? errorState,
      final List<MaterialEntity> materialList}) = _$MaterialsStateImpl;

  @override
  bool get isLoadingState;
  @override
  bool get isSuccessState;
  @override
  AppErrorHandler? get errorState;
  @override
  List<MaterialEntity> get materialList;

  /// Create a copy of MaterialsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialsStateImplCopyWith<_$MaterialsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
