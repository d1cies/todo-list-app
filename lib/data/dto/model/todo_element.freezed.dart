// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_element.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoElement _$TodoElementFromJson(Map<String, dynamic> json) {
  return _TodoElement.fromJson(json);
}

/// @nodoc
mixin _$TodoElement {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  Importance get importance => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;
  int? get deadline => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  int get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'changed_at')
  int get changedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_updated_by')
  String get lastUpdatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoElementCopyWith<TodoElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoElementCopyWith<$Res> {
  factory $TodoElementCopyWith(
          TodoElement value, $Res Function(TodoElement) then) =
      _$TodoElementCopyWithImpl<$Res, TodoElement>;
  @useResult
  $Res call(
      {String id,
      String text,
      Importance importance,
      bool done,
      int? deadline,
      String? color,
      @JsonKey(name: 'created_at') int createdAt,
      @JsonKey(name: 'changed_at') int changedAt,
      @JsonKey(name: 'last_updated_by') String lastUpdatedBy});
}

/// @nodoc
class _$TodoElementCopyWithImpl<$Res, $Val extends TodoElement>
    implements $TodoElementCopyWith<$Res> {
  _$TodoElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? importance = null,
    Object? done = null,
    Object? deadline = freezed,
    Object? color = freezed,
    Object? createdAt = null,
    Object? changedAt = null,
    Object? lastUpdatedBy = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as Importance,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as int?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      changedAt: null == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdatedBy: null == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoElementImplCopyWith<$Res>
    implements $TodoElementCopyWith<$Res> {
  factory _$$TodoElementImplCopyWith(
          _$TodoElementImpl value, $Res Function(_$TodoElementImpl) then) =
      __$$TodoElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String text,
      Importance importance,
      bool done,
      int? deadline,
      String? color,
      @JsonKey(name: 'created_at') int createdAt,
      @JsonKey(name: 'changed_at') int changedAt,
      @JsonKey(name: 'last_updated_by') String lastUpdatedBy});
}

/// @nodoc
class __$$TodoElementImplCopyWithImpl<$Res>
    extends _$TodoElementCopyWithImpl<$Res, _$TodoElementImpl>
    implements _$$TodoElementImplCopyWith<$Res> {
  __$$TodoElementImplCopyWithImpl(
      _$TodoElementImpl _value, $Res Function(_$TodoElementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? importance = null,
    Object? done = null,
    Object? deadline = freezed,
    Object? color = freezed,
    Object? createdAt = null,
    Object? changedAt = null,
    Object? lastUpdatedBy = null,
  }) {
    return _then(_$TodoElementImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as Importance,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as int?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      changedAt: null == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdatedBy: null == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$TodoElementImpl implements _TodoElement {
  _$TodoElementImpl(
      {required this.id,
      required this.text,
      required this.importance,
      required this.done,
      this.deadline,
      this.color,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'changed_at') required this.changedAt,
      @JsonKey(name: 'last_updated_by') required this.lastUpdatedBy});

  factory _$TodoElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoElementImplFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final Importance importance;
  @override
  final bool done;
  @override
  final int? deadline;
  @override
  final String? color;
  @override
  @JsonKey(name: 'created_at')
  final int createdAt;
  @override
  @JsonKey(name: 'changed_at')
  final int changedAt;
  @override
  @JsonKey(name: 'last_updated_by')
  final String lastUpdatedBy;

  @override
  String toString() {
    return 'TodoElement(id: $id, text: $text, importance: $importance, done: $done, deadline: $deadline, color: $color, createdAt: $createdAt, changedAt: $changedAt, lastUpdatedBy: $lastUpdatedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoElementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.importance, importance) ||
                other.importance == importance) &&
            (identical(other.done, done) || other.done == done) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.changedAt, changedAt) ||
                other.changedAt == changedAt) &&
            (identical(other.lastUpdatedBy, lastUpdatedBy) ||
                other.lastUpdatedBy == lastUpdatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, importance, done,
      deadline, color, createdAt, changedAt, lastUpdatedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoElementImplCopyWith<_$TodoElementImpl> get copyWith =>
      __$$TodoElementImplCopyWithImpl<_$TodoElementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoElementImplToJson(
      this,
    );
  }
}

abstract class _TodoElement implements TodoElement {
  factory _TodoElement(
      {required final String id,
      required final String text,
      required final Importance importance,
      required final bool done,
      final int? deadline,
      final String? color,
      @JsonKey(name: 'created_at') required final int createdAt,
      @JsonKey(name: 'changed_at') required final int changedAt,
      @JsonKey(name: 'last_updated_by')
      required final String lastUpdatedBy}) = _$TodoElementImpl;

  factory _TodoElement.fromJson(Map<String, dynamic> json) =
      _$TodoElementImpl.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  Importance get importance;
  @override
  bool get done;
  @override
  int? get deadline;
  @override
  String? get color;
  @override
  @JsonKey(name: 'created_at')
  int get createdAt;
  @override
  @JsonKey(name: 'changed_at')
  int get changedAt;
  @override
  @JsonKey(name: 'last_updated_by')
  String get lastUpdatedBy;
  @override
  @JsonKey(ignore: true)
  _$$TodoElementImplCopyWith<_$TodoElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
