// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoRequest _$TodoRequestFromJson(Map<String, dynamic> json) {
  return _TodoRequest.fromJson(json);
}

/// @nodoc
mixin _$TodoRequest {
  TodoElement get element => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoRequestCopyWith<TodoRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoRequestCopyWith<$Res> {
  factory $TodoRequestCopyWith(
          TodoRequest value, $Res Function(TodoRequest) then) =
      _$TodoRequestCopyWithImpl<$Res, TodoRequest>;
  @useResult
  $Res call({TodoElement element});

  $TodoElementCopyWith<$Res> get element;
}

/// @nodoc
class _$TodoRequestCopyWithImpl<$Res, $Val extends TodoRequest>
    implements $TodoRequestCopyWith<$Res> {
  _$TodoRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? element = null,
  }) {
    return _then(_value.copyWith(
      element: null == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as TodoElement,
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
abstract class _$$TodoRequestImplCopyWith<$Res>
    implements $TodoRequestCopyWith<$Res> {
  factory _$$TodoRequestImplCopyWith(
          _$TodoRequestImpl value, $Res Function(_$TodoRequestImpl) then) =
      __$$TodoRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TodoElement element});

  @override
  $TodoElementCopyWith<$Res> get element;
}

/// @nodoc
class __$$TodoRequestImplCopyWithImpl<$Res>
    extends _$TodoRequestCopyWithImpl<$Res, _$TodoRequestImpl>
    implements _$$TodoRequestImplCopyWith<$Res> {
  __$$TodoRequestImplCopyWithImpl(
      _$TodoRequestImpl _value, $Res Function(_$TodoRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? element = null,
  }) {
    return _then(_$TodoRequestImpl(
      element: null == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as TodoElement,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$TodoRequestImpl implements _TodoRequest {
  const _$TodoRequestImpl({required this.element});

  factory _$TodoRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoRequestImplFromJson(json);

  @override
  final TodoElement element;

  @override
  String toString() {
    return 'TodoRequest(element: $element)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoRequestImpl &&
            (identical(other.element, element) || other.element == element));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, element);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoRequestImplCopyWith<_$TodoRequestImpl> get copyWith =>
      __$$TodoRequestImplCopyWithImpl<_$TodoRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoRequestImplToJson(
      this,
    );
  }
}

abstract class _TodoRequest implements TodoRequest {
  const factory _TodoRequest({required final TodoElement element}) =
      _$TodoRequestImpl;

  factory _TodoRequest.fromJson(Map<String, dynamic> json) =
      _$TodoRequestImpl.fromJson;

  @override
  TodoElement get element;
  @override
  @JsonKey(ignore: true)
  _$$TodoRequestImplCopyWith<_$TodoRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
