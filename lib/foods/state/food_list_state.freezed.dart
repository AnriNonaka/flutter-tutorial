// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FoodListState {
//読み込み中の時はプログレス出したいよって時
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isReadyData => throw _privateConstructorUsedError; //読み込み終わったあとに表示させる
  List<Food> get foodItems => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodListStateCopyWith<FoodListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodListStateCopyWith<$Res> {
  factory $FoodListStateCopyWith(
          FoodListState value, $Res Function(FoodListState) then) =
      _$FoodListStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, bool isReadyData, List<Food> foodItems});
}

/// @nodoc
class _$FoodListStateCopyWithImpl<$Res>
    implements $FoodListStateCopyWith<$Res> {
  _$FoodListStateCopyWithImpl(this._value, this._then);

  final FoodListState _value;
  // ignore: unused_field
  final $Res Function(FoodListState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? foodItems = freezed,
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
      foodItems: foodItems == freezed
          ? _value.foodItems
          : foodItems // ignore: cast_nullable_to_non_nullable
              as List<Food>,
    ));
  }
}

/// @nodoc
abstract class _$$_FoodListStateCopyWith<$Res>
    implements $FoodListStateCopyWith<$Res> {
  factory _$$_FoodListStateCopyWith(
          _$_FoodListState value, $Res Function(_$_FoodListState) then) =
      __$$_FoodListStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, bool isReadyData, List<Food> foodItems});
}

/// @nodoc
class __$$_FoodListStateCopyWithImpl<$Res>
    extends _$FoodListStateCopyWithImpl<$Res>
    implements _$$_FoodListStateCopyWith<$Res> {
  __$$_FoodListStateCopyWithImpl(
      _$_FoodListState _value, $Res Function(_$_FoodListState) _then)
      : super(_value, (v) => _then(v as _$_FoodListState));

  @override
  _$_FoodListState get _value => super._value as _$_FoodListState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? foodItems = freezed,
  }) {
    return _then(_$_FoodListState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: isReadyData == freezed
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      foodItems: foodItems == freezed
          ? _value._foodItems
          : foodItems // ignore: cast_nullable_to_non_nullable
              as List<Food>,
    ));
  }
}

/// @nodoc

class _$_FoodListState implements _FoodListState {
  const _$_FoodListState(
      {this.isLoading = false,
      this.isReadyData = false,
      final List<Food> foodItems = const <Food>[]})
      : _foodItems = foodItems;

//読み込み中の時はプログレス出したいよって時
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isReadyData;
//読み込み終わったあとに表示させる
  final List<Food> _foodItems;
//読み込み終わったあとに表示させる
  @override
  @JsonKey()
  List<Food> get foodItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foodItems);
  }

  @override
  String toString() {
    return 'FoodListState(isLoading: $isLoading, isReadyData: $isReadyData, foodItems: $foodItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FoodListState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isReadyData, isReadyData) &&
            const DeepCollectionEquality()
                .equals(other._foodItems, _foodItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isReadyData),
      const DeepCollectionEquality().hash(_foodItems));

  @JsonKey(ignore: true)
  @override
  _$$_FoodListStateCopyWith<_$_FoodListState> get copyWith =>
      __$$_FoodListStateCopyWithImpl<_$_FoodListState>(this, _$identity);
}

abstract class _FoodListState implements FoodListState {
  const factory _FoodListState(
      {final bool isLoading,
      final bool isReadyData,
      final List<Food> foodItems}) = _$_FoodListState;

  @override //読み込み中の時はプログレス出したいよって時
  bool get isLoading;
  @override
  bool get isReadyData;
  @override //読み込み終わったあとに表示させる
  List<Food> get foodItems;
  @override
  @JsonKey(ignore: true)
  _$$_FoodListStateCopyWith<_$_FoodListState> get copyWith =>
      throw _privateConstructorUsedError;
}
