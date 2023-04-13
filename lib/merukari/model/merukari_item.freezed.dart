// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'merukari_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MerukariItem _$MerukariItemFromJson(Map<String, dynamic> json) {
  return _MerukariItem.fromJson(json);
}

/// @nodoc
mixin _$MerukariItem {
  @JsonKey(name: 'imagePath')
  String? get imagePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  String? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'compassion')
  String? get compassion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MerukariItemCopyWith<MerukariItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerukariItemCopyWith<$Res> {
  factory $MerukariItemCopyWith(
          MerukariItem value, $Res Function(MerukariItem) then) =
      _$MerukariItemCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'imagePath') String? imagePath,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'price') String? price,
      @JsonKey(name: 'compassion') String? compassion});
}

/// @nodoc
class _$MerukariItemCopyWithImpl<$Res> implements $MerukariItemCopyWith<$Res> {
  _$MerukariItemCopyWithImpl(this._value, this._then);

  final MerukariItem _value;
  // ignore: unused_field
  final $Res Function(MerukariItem) _then;

  @override
  $Res call({
    Object? imagePath = freezed,
    Object? title = freezed,
    Object? price = freezed,
    Object? compassion = freezed,
  }) {
    return _then(_value.copyWith(
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      compassion: compassion == freezed
          ? _value.compassion
          : compassion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_MerukariItemCopyWith<$Res>
    implements $MerukariItemCopyWith<$Res> {
  factory _$$_MerukariItemCopyWith(
          _$_MerukariItem value, $Res Function(_$_MerukariItem) then) =
      __$$_MerukariItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'imagePath') String? imagePath,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'price') String? price,
      @JsonKey(name: 'compassion') String? compassion});
}

/// @nodoc
class __$$_MerukariItemCopyWithImpl<$Res>
    extends _$MerukariItemCopyWithImpl<$Res>
    implements _$$_MerukariItemCopyWith<$Res> {
  __$$_MerukariItemCopyWithImpl(
      _$_MerukariItem _value, $Res Function(_$_MerukariItem) _then)
      : super(_value, (v) => _then(v as _$_MerukariItem));

  @override
  _$_MerukariItem get _value => super._value as _$_MerukariItem;

  @override
  $Res call({
    Object? imagePath = freezed,
    Object? title = freezed,
    Object? price = freezed,
    Object? compassion = freezed,
  }) {
    return _then(_$_MerukariItem(
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      compassion: compassion == freezed
          ? _value.compassion
          : compassion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MerukariItem implements _MerukariItem {
  const _$_MerukariItem(
      {@JsonKey(name: 'imagePath') this.imagePath,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'price') this.price,
      @JsonKey(name: 'compassion') this.compassion});

  factory _$_MerukariItem.fromJson(Map<String, dynamic> json) =>
      _$$_MerukariItemFromJson(json);

  @override
  @JsonKey(name: 'imagePath')
  final String? imagePath;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'price')
  final String? price;
  @override
  @JsonKey(name: 'compassion')
  final String? compassion;

  @override
  String toString() {
    return 'MerukariItem(imagePath: $imagePath, title: $title, price: $price, compassion: $compassion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MerukariItem &&
            const DeepCollectionEquality().equals(other.imagePath, imagePath) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.compassion, compassion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imagePath),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(compassion));

  @JsonKey(ignore: true)
  @override
  _$$_MerukariItemCopyWith<_$_MerukariItem> get copyWith =>
      __$$_MerukariItemCopyWithImpl<_$_MerukariItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MerukariItemToJson(
      this,
    );
  }
}

abstract class _MerukariItem implements MerukariItem {
  const factory _MerukariItem(
      {@JsonKey(name: 'imagePath') final String? imagePath,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'price') final String? price,
      @JsonKey(name: 'compassion') final String? compassion}) = _$_MerukariItem;

  factory _MerukariItem.fromJson(Map<String, dynamic> json) =
      _$_MerukariItem.fromJson;

  @override
  @JsonKey(name: 'imagePath')
  String? get imagePath;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'price')
  String? get price;
  @override
  @JsonKey(name: 'compassion')
  String? get compassion;
  @override
  @JsonKey(ignore: true)
  _$$_MerukariItemCopyWith<_$_MerukariItem> get copyWith =>
      throw _privateConstructorUsedError;
}
