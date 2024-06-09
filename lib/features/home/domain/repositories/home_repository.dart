import 'package:coffee_shop_360/core/managers/network/models/failure_model.dart';
import 'package:coffee_shop_360/core/managers/network/network_result.dart';
import 'package:coffee_shop_360/features/home/data/models/coffee_model.dart';

typedef CoffeeNetworkResult = NetworkResult<List<CoffeeModel?>, FailureModel>;

abstract interface class HomeRepository {
  Future<CoffeeNetworkResult> getAllCoffees();
}
