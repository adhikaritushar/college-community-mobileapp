// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminState {
  bool get isLoadingState => throw _privateConstructorUsedError;
  bool get isSuccessState => throw _privateConstructorUsedError;
  AppErrorHandler? get errorState => throw _privateConstructorUsedError;
  String get genderSelect => throw _privateConstructorUsedError;
  List<AdminEntity>? get adminData => throw _privateConstructorUsedError;

  /// Create a copy of AdminState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminStateCopyWith<AdminState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminStateCopyWith<$Res> {
  factory $AdminStateCopyWith(
          AdminState value, $Res Function(AdminState) then) =
      _$AdminStateCopyWithImpl<$Res, AdminState>;
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      AppErrorHandler? errorState,
      String genderSelect,
      List<AdminEntity>? adminData});
}

/// @nodoc
class _$AdminStateCopyWithImpl<$Res, $Val extends AdminState>
    implements $AdminStateCopyWith<$Res> {
  _$AdminStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? genderSelect = null,
    Object? adminData = freezed,
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
      adminData: freezed == adminData
          ? _value.adminData
          : adminData // ignore: cast_nullable_to_non_nullable
              as List<AdminEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminStateImplCopyWith<$Res>
    implements $AdminStateCopyWith<$Res> {
  factory _$$AdminStateImplCopyWith(
          _$AdminStateImpl value, $Res Function(_$AdminStateImpl) then) =
      __$$AdminStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      AppErrorHandler? errorState,
      String genderSelect,
      List<AdminEntity>? adminData});
}

/// @nodoc
class __$$AdminStateImplCopyWithImpl<$Res>
    extends _$AdminStateCopyWithImpl<$Res, _$AdminStateImpl>
    implements _$$AdminStateImplCopyWith<$Res> {
  __$$AdminStateImplCopyWithImpl(
      _$AdminStateImpl _value, $Res Function(_$AdminStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? genderSelect = null,
    Object? adminData = freezed,
  }) {
    return _then(_$AdminStateImpl(
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
      adminData: freezed == adminData
          ? _value._adminData
          : adminData // ignore: cast_nullable_to_non_nullable
              as List<AdminEntity>?,
    ));
  }
}

/// @nodoc

class _$AdminStateImpl implements _AdminState {
  const _$AdminStateImpl(
      {this.isLoadingState = false,
      this.isSuccessState = false,
      this.errorState,
      this.genderSelect = "",
      final List<AdminEntity>? adminData = const []})
      : _adminData = adminData;

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
  final List<AdminEntity>? _adminData;
  @override
  @JsonKey()
  List<AdminEntity>? get adminData {
    final value = _adminData;
    if (value == null) return null;
    if (_adminData is EqualUnmodifiableListView) return _adminData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AdminState(isLoadingState: $isLoadingState, isSuccessState: $isSuccessState, errorState: $errorState, genderSelect: $genderSelect, adminData: $adminData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminStateImpl &&
            (identical(other.isLoadingState, isLoadingState) ||
                other.isLoadingState == isLoadingState) &&
            (identical(other.isSuccessState, isSuccessState) ||
                other.isSuccessState == isSuccessState) &&
            (identical(other.errorState, errorState) ||
                other.errorState == errorState) &&
            (identical(other.genderSelect, genderSelect) ||
                other.genderSelect == genderSelect) &&
            const DeepCollectionEquality()
                .equals(other._adminData, _adminData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingState,
      isSuccessState,
      errorState,
      genderSelect,
      const DeepCollectionEquality().hash(_adminData));

  /// Create a copy of AdminState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminStateImplCopyWith<_$AdminStateImpl> get copyWith =>
      __$$AdminStateImplCopyWithImpl<_$AdminStateImpl>(this, _$identity);
}

abstract class _AdminState implements AdminState {
  const factory _AdminState(
      {final bool isLoadingState,
      final bool isSuccessState,
      final AppErrorHandler? errorState,
      final String genderSelect,
      final List<AdminEntity>? adminData}) = _$AdminStateImpl;

  @override
  bool get isLoadingState;
  @override
  bool get isSuccessState;
  @override
  AppErrorHandler? get errorState;
  @override
  String get genderSelect;
  @override
  List<AdminEntity>? get adminData;

  /// Create a copy of AdminState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminStateImplCopyWith<_$AdminStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
