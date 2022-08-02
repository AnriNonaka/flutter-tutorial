// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'youtube_client_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$YoutubeClientState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isReadyData => throw _privateConstructorUsedError;
  List<YoutubeItem> get youtubeItems => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $YoutubeClientStateCopyWith<YoutubeClientState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YoutubeClientStateCopyWith<$Res> {
  factory $YoutubeClientStateCopyWith(
          YoutubeClientState value, $Res Function(YoutubeClientState) then) =
      _$YoutubeClientStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, bool isReadyData, List<YoutubeItem> youtubeItems});
}

/// @nodoc
class _$YoutubeClientStateCopyWithImpl<$Res>
    implements $YoutubeClientStateCopyWith<$Res> {
  _$YoutubeClientStateCopyWithImpl(this._value, this._then);

  final YoutubeClientState _value;
  // ignore: unused_field
  final $Res Function(YoutubeClientState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? youtubeItems = freezed,
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
      youtubeItems: youtubeItems == freezed
          ? _value.youtubeItems
          : youtubeItems // ignore: cast_nullable_to_non_nullable
              as List<YoutubeItem>,
    ));
  }
}

/// @nodoc
abstract class _$$_YoutubeClientStateCopyWith<$Res>
    implements $YoutubeClientStateCopyWith<$Res> {
  factory _$$_YoutubeClientStateCopyWith(_$_YoutubeClientState value,
          $Res Function(_$_YoutubeClientState) then) =
      __$$_YoutubeClientStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, bool isReadyData, List<YoutubeItem> youtubeItems});
}

/// @nodoc
class __$$_YoutubeClientStateCopyWithImpl<$Res>
    extends _$YoutubeClientStateCopyWithImpl<$Res>
    implements _$$_YoutubeClientStateCopyWith<$Res> {
  __$$_YoutubeClientStateCopyWithImpl(
      _$_YoutubeClientState _value, $Res Function(_$_YoutubeClientState) _then)
      : super(_value, (v) => _then(v as _$_YoutubeClientState));

  @override
  _$_YoutubeClientState get _value => super._value as _$_YoutubeClientState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? youtubeItems = freezed,
  }) {
    return _then(_$_YoutubeClientState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: isReadyData == freezed
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      youtubeItems: youtubeItems == freezed
          ? _value._youtubeItems
          : youtubeItems // ignore: cast_nullable_to_non_nullable
              as List<YoutubeItem>,
    ));
  }
}

/// @nodoc

class _$_YoutubeClientState implements _YoutubeClientState {
  const _$_YoutubeClientState(
      {this.isLoading = false,
      this.isReadyData = false,
      final List<YoutubeItem> youtubeItems = const <YoutubeItem>[]})
      : _youtubeItems = youtubeItems;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isReadyData;
  final List<YoutubeItem> _youtubeItems;
  @override
  @JsonKey()
  List<YoutubeItem> get youtubeItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_youtubeItems);
  }

  @override
  String toString() {
    return 'YoutubeClientState(isLoading: $isLoading, isReadyData: $isReadyData, youtubeItems: $youtubeItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_YoutubeClientState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isReadyData, isReadyData) &&
            const DeepCollectionEquality()
                .equals(other._youtubeItems, _youtubeItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isReadyData),
      const DeepCollectionEquality().hash(_youtubeItems));

  @JsonKey(ignore: true)
  @override
  _$$_YoutubeClientStateCopyWith<_$_YoutubeClientState> get copyWith =>
      __$$_YoutubeClientStateCopyWithImpl<_$_YoutubeClientState>(
          this, _$identity);
}

abstract class _YoutubeClientState implements YoutubeClientState {
  const factory _YoutubeClientState(
      {final bool isLoading,
      final bool isReadyData,
      final List<YoutubeItem> youtubeItems}) = _$_YoutubeClientState;

  @override
  bool get isLoading;
  @override
  bool get isReadyData;
  @override
  List<YoutubeItem> get youtubeItems;
  @override
  @JsonKey(ignore: true)
  _$$_YoutubeClientStateCopyWith<_$_YoutubeClientState> get copyWith =>
      throw _privateConstructorUsedError;
}
