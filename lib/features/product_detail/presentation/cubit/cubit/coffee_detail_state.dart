part of 'coffee_detail_cubit.dart';

@freezed
class CoffeeDetailState with _$CoffeeDetailState {
  const factory CoffeeDetailState({
    ProcessStatus? pageStatus,
    CoffeeModel? coffeeModel,
  }) = _CoffeeDetailState;
}
