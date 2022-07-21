// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food_input_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FoodInputState {
//読み込み中の時はプログレス出したいよって時
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isReadyData =>
      throw _privateConstructorUsedError; //inputDialogのタグの選択がHashMapに保存される
  HashMap<String, bool>? get tagSelectState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodInputStateCopyWith<FoodInputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodInputStateCopyWith<$Res> {
  factory $FoodInputStateCopyWith(
          FoodInputState value, $Res Function(FoodInputState) then) =
      _$FoodInputStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isReadyData,
      HashMap<String, bool>? tagSelectState});
}

/// @nodoc
class _$FoodInputStateCopyWithImpl<$Res>
    implements $FoodInputStateCopyWith<$Res> {
  _$FoodInputStateCopyWithImpl(this._value, this._then);

  final FoodInputState _value;
  // ignore: unused_field
  final $Res Function(FoodInputState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? tagSelectState = freezed,
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
      tagSelectState: tagSelectState == freezed
          ? _value.tagSelectState
          : tagSelectState // ignore: cast_nullable_to_non_nullable
              as HashMap<String, bool>?,
    ));
  }
}

/// @nodoc
abstract class _$$_FoodInputStateCopyWith<$Res>
    implements $FoodInputStateCopyWith<$Res> {
  factory _$$_FoodInputStateCopyWith(
          _$_FoodInputState value, $Res Function(_$_FoodInputState) then) =
      __$$_FoodInputStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isReadyData,
      HashMap<String, bool>? tagSelectState});
}

/// @nodoc
class __$$_FoodInputStateCopyWithImpl<$Res>
    extends _$FoodInputStateCopyWithImpl<$Res>
    implements _$$_FoodInputStateCopyWith<$Res> {
  __$$_FoodInputStateCopyWithImpl(
      _$_FoodInputState _value, $Res Function(_$_FoodInputState) _then)
      : super(_value, (v) => _then(v as _$_FoodInputState));

  @override
  _$_FoodInputState get _value => super._value as _$_FoodInputState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? tagSelectState = freezed,
  }) {
    return _then(_$_FoodInputState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: isReadyData == freezed
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      tagSelectState: tagSelectState == freezed
          ? _value.tagSelectState
          : tagSelectState // ignore: cast_nullable_to_non_nullable
              as HashMap<String, bool>?,
    ));
  }
}

/// @nodoc

class _$_FoodInputState implements _FoodInputState {
  const _$_FoodInputState(
      {this.isLoading = false, this.isReadyData = false, this.tagSelectState});

//読み込み中の時はプログレス出したいよって時
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isReadyData;
//inputDialogのタグの選択がHashMapに保存される
  @override
  final HashMap<String, bool>? tagSelectState;

  @override
  String toString() {
    return 'FoodInputState(isLoading: $isLoading, isReadyData: $isReadyData, tagSelectState: $tagSelectState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FoodInputState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isReadyData, isReadyData) &&
            const DeepCollectionEquality()
                .equals(other.tagSelectState, tagSelectState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isReadyData),
      const DeepCollectionEquality().hash(tagSelectState));

  @JsonKey(ignore: true)
  @override
  _$$_FoodInputStateCopyWith<_$_FoodInputState> get copyWith =>
      __$$_FoodInputStateCopyWithImpl<_$_FoodInputState>(this, _$identity);
}

abstract class _FoodInputState implements FoodInputState {
  const factory _FoodInputState(
      {final bool isLoading,
      final bool isReadyData,
      final HashMap<String, bool>? tagSelectState}) = _$_FoodInputState;

  @override //読み込み中の時はプログレス出したいよって時
  bool get isLoading;
  @override
  bool get isReadyData;
  @override //inputDialogのタグの選択がHashMapに保存される
  HashMap<String, bool>? get tagSelectState;
  @override
  @JsonKey(ignore: true)
  _$$_FoodInputStateCopyWith<_$_FoodInputState> get copyWith =>
      throw _privateConstructorUsedError;
}
