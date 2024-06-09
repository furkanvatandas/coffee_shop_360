part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    ProcessStatus? pageStatus,
    @Default([]) List<CoffeeModel?> coffeeList,
    @Default([]) List<CoffeeModel?> coffeeFilteredList,
  }) = _HomeState;

  List<String?> get coffeeNames => coffeeList.map((item) => item?.title).toList();
}
