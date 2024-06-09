import 'package:coffee_shop_360/core/managers/network/models/failure_model.dart';
import 'package:coffee_shop_360/core/managers/network/network_manager.dart';
import 'package:coffee_shop_360/core/managers/network/network_result.dart';
import 'package:coffee_shop_360/features/home/data/models/coffee_model.dart';

class HomeDataSource {
  final NetworkManager<FailureModel> networkManager;

  const HomeDataSource({this.networkManager = cs360BaseNetworkManager});

  Future<NetworkResult<List<CoffeeModel?>, FailureModel>> fetchAllCoffees() async {
    return await networkManager.request<List<CoffeeModel?>, CoffeeModel>(
      parseModel: const CoffeeModel(),
      path: '/kahve/coffee',
      httpMethod: HttpMethods.get,
    );
  }
}
