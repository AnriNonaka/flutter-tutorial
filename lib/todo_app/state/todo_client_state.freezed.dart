// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_client_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoClientState {
//読み込み中の時はプログレス出したいよって時
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isReadyData => throw _privateConstructorUsedError;
  List<Todo> get todoItems => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoClientStateCopyWith<TodoClientState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoClientStateCopyWith<$Res> {
  factory $TodoClientStateCopyWith(
          TodoClientState value, $Res Function(TodoClientState) then) =
      _$TodoClientStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, bool isReadyData, List<Todo> todoItems});
}

/// @nodoc
class _$TodoClientStateCopyWithImpl<$Res>
    implements $TodoClientStateCopyWith<$Res> {
  _$TodoClientStateCopyWithImpl(this._value, this._then);

  final TodoClientState _value;
  // ignore: unused_field
  final $Res Function(TodoClientState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? todoItems = freezed,
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
      todoItems: todoItems == freezed
          ? _value.todoItems
          : todoItems // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ));
  }
}

/// @nodoc
abstract class _$$_TodoClientStateCopyWith<$Res>
    implements $TodoClientStateCopyWith<$Res> {
  factory _$$_TodoClientStateCopyWith(
          _$_TodoClientState value, $Res Function(_$_TodoClientState) then) =
      __$$_TodoClientStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, bool isReadyData, List<Todo> todoItems});
}

/// @nodoc
class __$$_TodoClientStateCopyWithImpl<$Res>
    extends _$TodoClientStateCopyWithImpl<$Res>
    implements _$$_TodoClientStateCopyWith<$Res> {
  __$$_TodoClientStateCopyWithImpl(
      _$_TodoClientState _value, $Res Function(_$_TodoClientState) _then)
      : super(_value, (v) => _then(v as _$_TodoClientState));

  @override
  _$_TodoClientState get _value => super._value as _$_TodoClientState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? todoItems = freezed,
  }) {
    return _then(_$_TodoClientState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: isReadyData == freezed
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      todoItems: todoItems == freezed
          ? _value._todoItems
          : todoItems // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ));
  }
}

/// @nodoc

class _$_TodoClientState implements _TodoClientState {
  const _$_TodoClientState(
      {this.isLoading = false,
      this.isReadyData = false,
      final List<Todo> todoItems = const <Todo>[]})
      : _todoItems = todoItems;

//読み込み中の時はプログレス出したいよって時
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isReadyData;
  final List<Todo> _todoItems;
  @override
  @JsonKey()
  List<Todo> get todoItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todoItems);
  }

  @override
  String toString() {
    return 'TodoClientState(isLoading: $isLoading, isReadyData: $isReadyData, todoItems: $todoItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoClientState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isReadyData, isReadyData) &&
            const DeepCollectionEquality()
                .equals(other._todoItems, _todoItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isReadyData),
      const DeepCollectionEquality().hash(_todoItems));

  @JsonKey(ignore: true)
  @override
  _$$_TodoClientStateCopyWith<_$_TodoClientState> get copyWith =>
      __$$_TodoClientStateCopyWithImpl<_$_TodoClientState>(this, _$identity);
}

abstract class _TodoClientState implements TodoClientState {
  const factory _TodoClientState(
      {final bool isLoading,
      final bool isReadyData,
      final List<Todo> todoItems}) = _$_TodoClientState;

  @override //読み込み中の時はプログレス出したいよって時
  bool get isLoading;
  @override
  bool get isReadyData;
  @override
  List<Todo> get todoItems;
  @override
  @JsonKey(ignore: true)
  _$$_TodoClientStateCopyWith<_$_TodoClientState> get copyWith =>
      throw _privateConstructorUsedError;
}
