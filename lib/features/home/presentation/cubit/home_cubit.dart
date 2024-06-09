import 'package:coffee_shop_360/core/managers/network/network_result.dart';
import 'package:coffee_shop_360/core/models/process_status.dart';
import 'package:coffee_shop_360/features/home/data/models/coffee_model.dart';
import 'package:coffee_shop_360/features/home/domain/usecases/get_all_coffees.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetAllCoffeesUseCase _getAllCoffeesUseCase;

  HomeCubit(this._getAllCoffeesUseCase) : super(HomeState(pageStatus: ProcessStatusInitial()));

  Future<void> getAllCoffees() async {
    emit(state.copyWith(pageStatus: ProcessStatusLoading()));

    var useCase = await _getAllCoffeesUseCase();

    switch (useCase) {
      case NetworkResultSuccess(data: var data):
        emit(state.copyWith(
          pageStatus: ProcessStatusSuccess(),
          coffeeList: data,
          coffeeFilteredList: data,
        ));
      case NetworkResultFailure(failure: var _):
        emit(state.copyWith(pageStatus: ProcessStatusFailure()));
      default:
    }
  }

  void searchCoffee(String name) {
    if (name.isEmpty) {
      emit(state.copyWith(
        pageStatus: ProcessStatusSuccess(),
        coffeeFilteredList: state.coffeeList,
      ));
      return;
    }
    final lowerCaseName = name.toLowerCase();

    final filteredList = state.coffeeList.where(
      (coffeeModel) {
        final title = coffeeModel?.title?.toLowerCase();
        return title?.contains(lowerCaseName) ?? false;
      },
    ).toList();

    emit(state.copyWith(
      pageStatus: ProcessStatusSuccess(),
      coffeeFilteredList: filteredList,
    ));
  }
}
