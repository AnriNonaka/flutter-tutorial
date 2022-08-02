// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'residence_client_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResidenceClientState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isReadyData => throw _privateConstructorUsedError;
  List<ResidenceItem> get residenceItems => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResidenceClientStateCopyWith<ResidenceClientState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResidenceClientStateCopyWith<$Res> {
  factory $ResidenceClientStateCopyWith(ResidenceClientState value,
          $Res Function(ResidenceClientState) then) =
      _$ResidenceClientStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading, bool isReadyData, List<ResidenceItem> residenceItems});
}

/// @nodoc
class _$ResidenceClientStateCopyWithImpl<$Res>
    implements $ResidenceClientStateCopyWith<$Res> {
  _$ResidenceClientStateCopyWithImpl(this._value, this._then);

  final ResidenceClientState _value;
  // ignore: unused_field
  final $Res Function(ResidenceClientState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? residenceItems = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: isReadyData == freezed
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      residenceItems: residenceItems == freezed
          ? _value.residenceItems
          : residenceItems // ignore: cast_nullable_to_non_nullable
              as List<ResidenceItem>,
    ));
  }
}

/// @nodoc
abstract class _$$_ResidenceClientStateCopyWith<$Res>
    implements $ResidenceClientStateCopyWith<$Res> {
  factory _$$_ResidenceClientStateCopyWith(_$_ResidenceClientState value,
          $Res Function(_$_ResidenceClientState) then) =
      __$$_ResidenceClientStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading, bool isReadyData, List<ResidenceItem> residenceItems});
}

/// @nodoc
class __$$_ResidenceClientStateCopyWithImpl<$Res>
    extends _$ResidenceClientStateCopyWithImpl<$Res>
    implements _$$_ResidenceClientStateCopyWith<$Res> {
  __$$_ResidenceClientStateCopyWithImpl(_$_ResidenceClientState _value,
      $Res Function(_$_ResidenceClientState) _then)
      : super(_value, (v) => _then(v as _$_ResidenceClientState));

  @override
  _$_ResidenceClientState get _value => super._value as _$_ResidenceClientState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? residenceItems = freezed,
  }) {
    return _then(_$_ResidenceClientState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: isReadyData == freezed
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      residenceItems: residenceItems == freezed
          ? _value._residenceItems
          : residenceItems // ignore: cast_nullable_to_non_nullable
              as List<ResidenceItem>,
    ));
  }
}

/// @nodoc

class _$_ResidenceClientState implements _ResidenceClientState {
  const _$_ResidenceClientState(
      {this.isLoading = false,
      this.isReadyData = false,
      final List<ResidenceItem> residenceItems = const <ResidenceItem>[]})
      : _residenceItems = residenceItems;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isReadyData;
  final List<ResidenceItem> _residenceItems;
  @override
  @JsonKey()
  List<ResidenceItem> get residenceItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_residenceItems);
  }

  @override
  String toString() {
    return 'ResidenceClientState(isLoading: $isLoading, isReadyData: $isReadyData, residenceItems: $residenceItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResidenceClientState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isReadyData, isReadyData) &&
            const DeepCollectionEquality()
                .equals(other._residenceItems, _residenceItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isReadyData),
      const DeepCollectionEquality().hash(_residenceItems));

  @JsonKey(ignore: true)
  @override
  _$$_ResidenceClientStateCopyWith<_$_ResidenceClientState> get copyWith =>
      __$$_ResidenceClientStateCopyWithImpl<_$_ResidenceClientState>(
          this, _$identity);
}

abstract class _ResidenceClientState implements ResidenceClientState {
  const factory _ResidenceClientState(
      {final bool isLoading,
      final bool isReadyData,
      final List<ResidenceItem> residenceItems}) = _$_ResidenceClientState;

  @override
  bool get isLoading;
  @override
  bool get isReadyData;
  @override
  List<ResidenceItem> get residenceItems;
  @override
  @JsonKey(ignore: true)
  _$$_ResidenceClientStateCopyWith<_$_ResidenceClientState> get copyWith =>
      throw _privateConstructorUsedError;
}
