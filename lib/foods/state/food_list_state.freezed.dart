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
//ローディング中か
  bool get isLoading => throw _privateConstructorUsedError; //リストが揃ってるか
  bool get isReadyData =>
      throw _privateConstructorUsedError; //読み込み終わったあとに表示させるリストの中身
//filterDialogの時はこのfoodItemsを絞り込みする
  List<Food> get foodItems =>
      throw _privateConstructorUsedError; //現在どんなフォルターで絞り込んでるか
  List<String> get tags => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodListStateCopyWith<FoodListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodListStateCopyWith<$Res> {
  factory $FoodListStateCopyWith(
          FoodListState value, $Res Function(FoodListState) then) =
      _$FoodListStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isReadyData,
      List<Food> foodItems,
      List<String> tags});
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
    Object? tags = freezed,
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
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
  $Res call(
      {bool isLoading,
      bool isReadyData,
      List<Food> foodItems,
      List<String> tags});
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
    Object? tags = freezed,
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
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_FoodListState implements _FoodListState {
  const _$_FoodListState(
      {this.isLoading = false,
      this.isReadyData = false,
      final List<Food> foodItems = const <Food>[],
      final List<String> tags = const <String>[]})
      : _foodItems = foodItems,
        _tags = tags;

//ローディング中か
  @override
  @JsonKey()
  final bool isLoading;
//リストが揃ってるか
  @override
  @JsonKey()
  final bool isReadyData;
//読み込み終わったあとに表示させるリストの中身
//filterDialogの時はこのfoodItemsを絞り込みする
  final List<Food> _foodItems;
//読み込み終わったあとに表示させるリストの中身
//filterDialogの時はこのfoodItemsを絞り込みする
  @override
  @JsonKey()
  List<Food> get foodItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foodItems);
  }

//現在どんなフォルターで絞り込んでるか
  final List<String> _tags;
//現在どんなフォルターで絞り込んでるか
  @override
  @JsonKey()
  List<String> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'FoodListState(isLoading: $isLoading, isReadyData: $isReadyData, foodItems: $foodItems, tags: $tags)';
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
                .equals(other._foodItems, _foodItems) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isReadyData),
      const DeepCollectionEquality().hash(_foodItems),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  _$$_FoodListStateCopyWith<_$_FoodListState> get copyWith =>
      __$$_FoodListStateCopyWithImpl<_$_FoodListState>(this, _$identity);
}

abstract class _FoodListState implements FoodListState {
  const factory _FoodListState(
      {final bool isLoading,
      final bool isReadyData,
      final List<Food> foodItems,
      final List<String> tags}) = _$_FoodListState;

  @override //ローディング中か
  bool get isLoading;
  @override //リストが揃ってるか
  bool get isReadyData;
  @override //読み込み終わったあとに表示させるリストの中身
//filterDialogの時はこのfoodItemsを絞り込みする
  List<Food> get foodItems;
  @override //現在どんなフォルターで絞り込んでるか
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_FoodListStateCopyWith<_$_FoodListState> get copyWith =>
      throw _privateConstructorUsedError;
}
