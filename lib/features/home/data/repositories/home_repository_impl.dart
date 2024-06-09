import 'package:coffee_shop_360/features/home/data/data_sources/home_data_source.dart';
import 'package:coffee_shop_360/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource _homeDataSource;

  HomeRepositoryImpl(this._homeDataSource);

  @override
  Future<CoffeeNetworkResult> getAllCoffees() async {
    return await _homeDataSource.fetchAllCoffees();
  }
}
