// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food_filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FoodFilterState {
//ローディング中か
  bool get isLoading => throw _privateConstructorUsedError; //リストが揃ってるか
  bool get isReadyData =>
      throw _privateConstructorUsedError; //読み込み終わったあとに表示させるリストの中身
  HashMap<String, bool>? get filterTagSelectState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodFilterStateCopyWith<FoodFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodFilterStateCopyWith<$Res> {
  factory $FoodFilterStateCopyWith(
          FoodFilterState value, $Res Function(FoodFilterState) then) =
      _$FoodFilterStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isReadyData,
      HashMap<String, bool>? filterTagSelectState});
}

/// @nodoc
class _$FoodFilterStateCopyWithImpl<$Res>
    implements $FoodFilterStateCopyWith<$Res> {
  _$FoodFilterStateCopyWithImpl(this._value, this._then);

  final FoodFilterState _value;
  // ignore: unused_field
  final $Res Function(FoodFilterState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? filterTagSelectState = freezed,
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
      filterTagSelectState: filterTagSelectState == freezed
          ? _value.filterTagSelectState
          : filterTagSelectState // ignore: cast_nullable_to_non_nullable
              as HashMap<String, bool>?,
    ));
  }
}

/// @nodoc
abstract class _$$_FoodFilterStateCopyWith<$Res>
    implements $FoodFilterStateCopyWith<$Res> {
  factory _$$_FoodFilterStateCopyWith(
          _$_FoodFilterState value, $Res Function(_$_FoodFilterState) then) =
      __$$_FoodFilterStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isReadyData,
      HashMap<String, bool>? filterTagSelectState});
}

/// @nodoc
class __$$_FoodFilterStateCopyWithImpl<$Res>
    extends _$FoodFilterStateCopyWithImpl<$Res>
    implements _$$_FoodFilterStateCopyWith<$Res> {
  __$$_FoodFilterStateCopyWithImpl(
      _$_FoodFilterState _value, $Res Function(_$_FoodFilterState) _then)
      : super(_value, (v) => _then(v as _$_FoodFilterState));

  @override
  _$_FoodFilterState get _value => super._value as _$_FoodFilterState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? filterTagSelectState = freezed,
  }) {
    return _then(_$_FoodFilterState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: isReadyData == freezed
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      filterTagSelectState: filterTagSelectState == freezed
          ? _value.filterTagSelectState
          : filterTagSelectState // ignore: cast_nullable_to_non_nullable
              as HashMap<String, bool>?,
    ));
  }
}

/// @nodoc

class _$_FoodFilterState implements _FoodFilterState {
  const _$_FoodFilterState(
      {this.isLoading = false,
      this.isReadyData = false,
      this.filterTagSelectState});

//ローディング中か
  @override
  @JsonKey()
  final bool isLoading;
//リストが揃ってるか
  @override
  @JsonKey()
  final bool isReadyData;
//読み込み終わったあとに表示させるリストの中身
  @override
  final HashMap<String, bool>? filterTagSelectState;

  @override
  String toString() {
    return 'FoodFilterState(isLoading: $isLoading, isReadyData: $isReadyData, filterTagSelectState: $filterTagSelectState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FoodFilterState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isReadyData, isReadyData) &&
            const DeepCollectionEquality()
                .equals(other.filterTagSelectState, filterTagSelectState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isReadyData),
      const DeepCollectionEquality().hash(filterTagSelectState));

  @JsonKey(ignore: true)
  @override
  _$$_FoodFilterStateCopyWith<_$_FoodFilterState> get copyWith =>
      __$$_FoodFilterStateCopyWithImpl<_$_FoodFilterState>(this, _$identity);
}

abstract class _FoodFilterState implements FoodFilterState {
  const factory _FoodFilterState(
      {final bool isLoading,
      final bool isReadyData,
      final HashMap<String, bool>? filterTagSelectState}) = _$_FoodFilterState;

  @override //ローディング中か
  bool get isLoading;
  @override //リストが揃ってるか
  bool get isReadyData;
  @override //読み込み終わったあとに表示させるリストの中身
  HashMap<String, bool>? get filterTagSelectState;
  @override
  @JsonKey(ignore: true)
  _$$_FoodFilterStateCopyWith<_$_FoodFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}
