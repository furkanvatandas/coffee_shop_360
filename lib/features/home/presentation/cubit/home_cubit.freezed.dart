// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  ProcessStatus? get pageStatus => throw _privateConstructorUsedError;
  List<CoffeeModel?> get coffeeList => throw _privateConstructorUsedError;
  List<CoffeeModel?> get coffeeFilteredList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {ProcessStatus? pageStatus,
      List<CoffeeModel?> coffeeList,
      List<CoffeeModel?> coffeeFilteredList});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageStatus = freezed,
    Object? coffeeList = null,
    Object? coffeeFilteredList = null,
  }) {
    return _then(_value.copyWith(
      pageStatus: freezed == pageStatus
          ? _value.pageStatus
          : pageStatus // ignore: cast_nullable_to_non_nullable
              as ProcessStatus?,
      coffeeList: null == coffeeList
          ? _value.coffeeList
          : coffeeList // ignore: cast_nullable_to_non_nullable
              as List<CoffeeModel?>,
      coffeeFilteredList: null == coffeeFilteredList
          ? _value.coffeeFilteredList
          : coffeeFilteredList // ignore: cast_nullable_to_non_nullable
              as List<CoffeeModel?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProcessStatus? pageStatus,
      List<CoffeeModel?> coffeeList,
      List<CoffeeModel?> coffeeFilteredList});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageStatus = freezed,
    Object? coffeeList = null,
    Object? coffeeFilteredList = null,
  }) {
    return _then(_$HomeStateImpl(
      pageStatus: freezed == pageStatus
          ? _value.pageStatus
          : pageStatus // ignore: cast_nullable_to_non_nullable
              as ProcessStatus?,
      coffeeList: null == coffeeList
          ? _value._coffeeList
          : coffeeList // ignore: cast_nullable_to_non_nullable
              as List<CoffeeModel?>,
      coffeeFilteredList: null == coffeeFilteredList
          ? _value._coffeeFilteredList
          : coffeeFilteredList // ignore: cast_nullable_to_non_nullable
              as List<CoffeeModel?>,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl extends _HomeState {
  const _$HomeStateImpl(
      {this.pageStatus,
      final List<CoffeeModel?> coffeeList = const [],
      final List<CoffeeModel?> coffeeFilteredList = const []})
      : _coffeeList = coffeeList,
        _coffeeFilteredList = coffeeFilteredList,
        super._();

  @override
  final ProcessStatus? pageStatus;
  final List<CoffeeModel?> _coffeeList;
  @override
  @JsonKey()
  List<CoffeeModel?> get coffeeList {
    if (_coffeeList is EqualUnmodifiableListView) return _coffeeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coffeeList);
  }

  final List<CoffeeModel?> _coffeeFilteredList;
  @override
  @JsonKey()
  List<CoffeeModel?> get coffeeFilteredList {
    if (_coffeeFilteredList is EqualUnmodifiableListView)
      return _coffeeFilteredList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coffeeFilteredList);
  }

  @override
  String toString() {
    return 'HomeState(pageStatus: $pageStatus, coffeeList: $coffeeList, coffeeFilteredList: $coffeeFilteredList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.pageStatus, pageStatus) ||
                other.pageStatus == pageStatus) &&
            const DeepCollectionEquality()
                .equals(other._coffeeList, _coffeeList) &&
            const DeepCollectionEquality()
                .equals(other._coffeeFilteredList, _coffeeFilteredList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pageStatus,
      const DeepCollectionEquality().hash(_coffeeList),
      const DeepCollectionEquality().hash(_coffeeFilteredList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  const factory _HomeState(
      {final ProcessStatus? pageStatus,
      final List<CoffeeModel?> coffeeList,
      final List<CoffeeModel?> coffeeFilteredList}) = _$HomeStateImpl;
  const _HomeState._() : super._();

  @override
  ProcessStatus? get pageStatus;
  @override
  List<CoffeeModel?> get coffeeList;
  @override
  List<CoffeeModel?> get coffeeFilteredList;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
