// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoResponse _$TodoResponseFromJson(Map<String, dynamic> json) {
  return _TodoResponse.fromJson(json);
}

/// @nodoc
mixin _$TodoResponse {
  String get status => throw _privateConstructorUsedError;
  TodoElement get element => throw _privateConstructorUsedError;
  int get revision => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoResponseCopyWith<TodoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoResponseCopyWith<$Res> {
  factory $TodoResponseCopyWith(
          TodoResponse value, $Res Function(TodoResponse) then) =
      _$TodoResponseCopyWithImpl<$Res, TodoResponse>;
  @useResult
  $Res call({String status, TodoElement element, int revision});

  $TodoElementCopyWith<$Res> get element;
}

/// @nodoc
class _$TodoResponseCopyWithImpl<$Res, $Val extends TodoResponse>
    implements $TodoResponseCopyWith<$Res> {
  _$TodoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? element = null,
    Object? revision = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      element: null == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as TodoElement,
      revision: null == revision
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TodoElementCopyWith<$Res> get element {
    return $TodoElementCopyWith<$Res>(_value.element, (value) {
      return _then(_value.copyWith(element: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TodoResponseImplCopyWith<$Res>
    implements $TodoResponseCopyWith<$Res> {
  factory _$$TodoResponseImplCopyWith(
          _$TodoResponseImpl value, $Res Function(_$TodoResponseImpl) then) =
      __$$TodoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, TodoElement element, int revision});

  @override
  $TodoElementCopyWith<$Res> get element;
}

/// @nodoc
class __$$TodoResponseImplCopyWithImpl<$Res>
    extends _$TodoResponseCopyWithImpl<$Res, _$TodoResponseImpl>
    implements _$$TodoResponseImplCopyWith<$Res> {
  __$$TodoResponseImplCopyWithImpl(
      _$TodoResponseImpl _value, $Res Function(_$TodoResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? element = null,
    Object? revision = null,
  }) {
    return _then(_$TodoResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      element: null == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as TodoElement,
      revision: null == revision
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$TodoResponseImpl implements _TodoResponse {
  const _$TodoResponseImpl(
      {required this.status, required this.element, required this.revision});

  factory _$TodoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoResponseImplFromJson(json);

  @override
  final String status;
  @override
  final TodoElement element;
  @override
  final int revision;

  @override
  String toString() {
    return 'TodoResponse(status: $status, element: $element, revision: $revision)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.element, element) || other.element == element) &&
            (identical(other.revision, revision) ||
                other.revision == revision));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, element, revision);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoResponseImplCopyWith<_$TodoResponseImpl> get copyWith =>
      __$$TodoResponseImplCopyWithImpl<_$TodoResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoResponseImplToJson(
      this,
    );
  }
}

abstract class _TodoResponse implements TodoResponse {
  const factory _TodoResponse(
      {required final String status,
      required final TodoElement element,
      required final int revision}) = _$TodoResponseImpl;

  factory _TodoResponse.fromJson(Map<String, dynamic> json) =
      _$TodoResponseImpl.fromJson;

  @override
  String get status;
  @override
  TodoElement get element;
  @override
  int get revision;
  @override
  @JsonKey(ignore: true)
  _$$TodoResponseImplCopyWith<_$TodoResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
