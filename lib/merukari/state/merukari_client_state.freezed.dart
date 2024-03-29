// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'merukari_client_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MerukariClientState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isReadyData => throw _privateConstructorUsedError;
  List<MerukariItem> get merukariItems => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MerukariClientStateCopyWith<MerukariClientState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerukariClientStateCopyWith<$Res> {
  factory $MerukariClientStateCopyWith(
          MerukariClientState value, $Res Function(MerukariClientState) then) =
      _$MerukariClientStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading, bool isReadyData, List<MerukariItem> merukariItems});
}

/// @nodoc
class _$MerukariClientStateCopyWithImpl<$Res>
    implements $MerukariClientStateCopyWith<$Res> {
  _$MerukariClientStateCopyWithImpl(this._value, this._then);

  final MerukariClientState _value;
  // ignore: unused_field
  final $Res Function(MerukariClientState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? merukariItems = freezed,
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
      merukariItems: merukariItems == freezed
          ? _value.merukariItems
          : merukariItems // ignore: cast_nullable_to_non_nullable
              as List<MerukariItem>,
    ));
  }
}

/// @nodoc
abstract class _$$_MerukariClientStateCopyWith<$Res>
    implements $MerukariClientStateCopyWith<$Res> {
  factory _$$_MerukariClientStateCopyWith(_$_MerukariClientState value,
          $Res Function(_$_MerukariClientState) then) =
      __$$_MerukariClientStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading, bool isReadyData, List<MerukariItem> merukariItems});
}

/// @nodoc
class __$$_MerukariClientStateCopyWithImpl<$Res>
    extends _$MerukariClientStateCopyWithImpl<$Res>
    implements _$$_MerukariClientStateCopyWith<$Res> {
  __$$_MerukariClientStateCopyWithImpl(_$_MerukariClientState _value,
      $Res Function(_$_MerukariClientState) _then)
      : super(_value, (v) => _then(v as _$_MerukariClientState));

  @override
  _$_MerukariClientState get _value => super._value as _$_MerukariClientState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? merukariItems = freezed,
  }) {
    return _then(_$_MerukariClientState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: isReadyData == freezed
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      merukariItems: merukariItems == freezed
          ? _value._merukariItems
          : merukariItems // ignore: cast_nullable_to_non_nullable
              as List<MerukariItem>,
    ));
  }
}

/// @nodoc

class _$_MerukariClientState implements _MerukariClientState {
  const _$_MerukariClientState(
      {this.isLoading = false,
      this.isReadyData = false,
      final List<MerukariItem> merukariItems = const <MerukariItem>[]})
      : _merukariItems = merukariItems;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isReadyData;
  final List<MerukariItem> _merukariItems;
  @override
  @JsonKey()
  List<MerukariItem> get merukariItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_merukariItems);
  }

  @override
  String toString() {
    return 'MerukariClientState(isLoading: $isLoading, isReadyData: $isReadyData, merukariItems: $merukariItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MerukariClientState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isReadyData, isReadyData) &&
            const DeepCollectionEquality()
                .equals(other._merukariItems, _merukariItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isReadyData),
      const DeepCollectionEquality().hash(_merukariItems));

  @JsonKey(ignore: true)
  @override
  _$$_MerukariClientStateCopyWith<_$_MerukariClientState> get copyWith =>
      __$$_MerukariClientStateCopyWithImpl<_$_MerukariClientState>(
          this, _$identity);
}

abstract class _MerukariClientState implements MerukariClientState {
  const factory _MerukariClientState(
      {final bool isLoading,
      final bool isReadyData,
      final List<MerukariItem> merukariItems}) = _$_MerukariClientState;

  @override
  bool get isLoading;
  @override
  bool get isReadyData;
  @override
  List<MerukariItem> get merukariItems;
  @override
  @JsonKey(ignore: true)
  _$$_MerukariClientStateCopyWith<_$_MerukariClientState> get copyWith =>
      throw _privateConstructorUsedError;
}
