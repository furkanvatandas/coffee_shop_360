// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coffee_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CoffeeDetailState {
  ProcessStatus? get pageStatus => throw _privateConstructorUsedError;
  CoffeeModel? get coffeeModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoffeeDetailStateCopyWith<CoffeeDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeDetailStateCopyWith<$Res> {
  factory $CoffeeDetailStateCopyWith(
          CoffeeDetailState value, $Res Function(CoffeeDetailState) then) =
      _$CoffeeDetailStateCopyWithImpl<$Res, CoffeeDetailState>;
  @useResult
  $Res call({ProcessStatus? pageStatus, CoffeeModel? coffeeModel});
}

/// @nodoc
class _$CoffeeDetailStateCopyWithImpl<$Res, $Val extends CoffeeDetailState>
    implements $CoffeeDetailStateCopyWith<$Res> {
  _$CoffeeDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageStatus = freezed,
    Object? coffeeModel = freezed,
  }) {
    return _then(_value.copyWith(
      pageStatus: freezed == pageStatus
          ? _value.pageStatus
          : pageStatus // ignore: cast_nullable_to_non_nullable
              as ProcessStatus?,
      coffeeModel: freezed == coffeeModel
          ? _value.coffeeModel
          : coffeeModel // ignore: cast_nullable_to_non_nullable
              as CoffeeModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoffeeDetailStateImplCopyWith<$Res>
    implements $CoffeeDetailStateCopyWith<$Res> {
  factory _$$CoffeeDetailStateImplCopyWith(_$CoffeeDetailStateImpl value,
          $Res Function(_$CoffeeDetailStateImpl) then) =
      __$$CoffeeDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProcessStatus? pageStatus, CoffeeModel? coffeeModel});
}

/// @nodoc
class __$$CoffeeDetailStateImplCopyWithImpl<$Res>
    extends _$CoffeeDetailStateCopyWithImpl<$Res, _$CoffeeDetailStateImpl>
    implements _$$CoffeeDetailStateImplCopyWith<$Res> {
  __$$CoffeeDetailStateImplCopyWithImpl(_$CoffeeDetailStateImpl _value,
      $Res Function(_$CoffeeDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageStatus = freezed,
    Object? coffeeModel = freezed,
  }) {
    return _then(_$CoffeeDetailStateImpl(
      pageStatus: freezed == pageStatus
          ? _value.pageStatus
          : pageStatus // ignore: cast_nullable_to_non_nullable
              as ProcessStatus?,
      coffeeModel: freezed == coffeeModel
          ? _value.coffeeModel
          : coffeeModel // ignore: cast_nullable_to_non_nullable
              as CoffeeModel?,
    ));
  }
}

/// @nodoc

class _$CoffeeDetailStateImpl implements _CoffeeDetailState {
  const _$CoffeeDetailStateImpl({this.pageStatus, this.coffeeModel});

  @override
  final ProcessStatus? pageStatus;
  @override
  final CoffeeModel? coffeeModel;

  @override
  String toString() {
    return 'CoffeeDetailState(pageStatus: $pageStatus, coffeeModel: $coffeeModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoffeeDetailStateImpl &&
            (identical(other.pageStatus, pageStatus) ||
                other.pageStatus == pageStatus) &&
            (identical(other.coffeeModel, coffeeModel) ||
                other.coffeeModel == coffeeModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageStatus, coffeeModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoffeeDetailStateImplCopyWith<_$CoffeeDetailStateImpl> get copyWith =>
      __$$CoffeeDetailStateImplCopyWithImpl<_$CoffeeDetailStateImpl>(
          this, _$identity);
}

abstract class _CoffeeDetailState implements CoffeeDetailState {
  const factory _CoffeeDetailState(
      {final ProcessStatus? pageStatus,
      final CoffeeModel? coffeeModel}) = _$CoffeeDetailStateImpl;

  @override
  ProcessStatus? get pageStatus;
  @override
  CoffeeModel? get coffeeModel;
  @override
  @JsonKey(ignore: true)
  _$$CoffeeDetailStateImplCopyWith<_$CoffeeDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
