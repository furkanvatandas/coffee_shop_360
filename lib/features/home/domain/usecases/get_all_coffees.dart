import 'package:coffee_shop_360/core/usecase/usecase.dart';
import 'package:coffee_shop_360/features/home/domain/repositories/home_repository.dart';

class GetAllCoffeesUseCase implements UsecaseWithoutParams {
  const GetAllCoffeesUseCase(this._repository);

  final HomeRepository _repository;

  @override
  Future<CoffeeNetworkResult> call() async => await _repository.getAllCoffees();
}
