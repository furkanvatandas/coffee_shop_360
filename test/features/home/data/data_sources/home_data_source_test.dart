import 'package:coffee_shop_360/core/managers/network/models/failure_model.dart';
import 'package:coffee_shop_360/core/managers/network/network_manager.dart';
import 'package:coffee_shop_360/core/managers/network/network_result.dart';
import 'package:coffee_shop_360/features/home/data/data_sources/home_data_source.dart';
import 'package:coffee_shop_360/features/home/data/models/coffee_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import '../../../../sample_data.dart';
import 'home_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NetworkManager>()])
void main() {
  late HomeDataSource homeDataSource;
  late MockNetworkManager<FailureModel> mockBaseNetworkManager;

  setUp(() {
    mockBaseNetworkManager = MockNetworkManager<FailureModel>();
    homeDataSource = HomeDataSource(networkManager: mockBaseNetworkManager);

    provideDummy<NetworkResult<List<CoffeeModel?>, FailureModel>>(
      NetworkResultSuccess<List<CoffeeModel?>, FailureModel>(SampleTestData.coffeeModelList),
    );
  });

  test(
    "API returns a list of CoffeeModel on success",
    () async {
      NetworkManager<FailureModel> baseNetworkManager = const NetworkManager<FailureModel>(
        baseUrl: 'apimocha.com',
        failureModel: FailureModel(),
      );

      var result = await baseNetworkManager.request<List<CoffeeModel?>, CoffeeModel>(
        parseModel: const CoffeeModel(),
        path: '/kahve/coffee',
        httpMethod: HttpMethods.get,
      );

      // Assert
      expect(result, isA<NetworkResultSuccess>());
      final successResult = result as NetworkResultSuccess<List<CoffeeModel?>, FailureModel>;
      expect(successResult.data, isA<List<CoffeeModel>>());
      expect(successResult.data.length, greaterThan(0));
    },
  );

  test(
    "fetchAllCoffees returns a list of CoffeeModel on success with Mock",
    () async {
      when(mockBaseNetworkManager.request<List<CoffeeModel?>, CoffeeModel>(
        path: "",
        parseModel: const CoffeeModel(),
        httpMethod: HttpMethods.get,
      )).thenAnswer(
        (_) async => NetworkResultSuccess<List<CoffeeModel?>, FailureModel>(SampleTestData.coffeeModelList),
      );

      // Act
      final result = await homeDataSource.fetchAllCoffees();

      // Assert
      expect(result, isA<NetworkResultSuccess>());
      final successResult = result as NetworkResultSuccess<List<CoffeeModel?>, FailureModel>;
      expect(successResult.data, isA<List<CoffeeModel>>());
      expect(successResult.data.length, greaterThan(0));
    },
  );

  test(
    "fetchAllCoffees returns a list of CoffeeModel on failure with Mock",
    () async {
      when(mockBaseNetworkManager.request<List<CoffeeModel?>, CoffeeModel>(
        path: "",
        parseModel: const CoffeeModel(),
        httpMethod: HttpMethods.get,
      )).thenAnswer(
        (_) async => NetworkResultFailure<List<CoffeeModel?>, FailureModel>(const FailureModel(errorMessage: "Error")),
      );

      // Act
      final result = await homeDataSource.fetchAllCoffees();

      expect(result, isA<NetworkResultSuccess>());
      final successResult = result as NetworkResultSuccess<List<CoffeeModel?>, FailureModel>;
      expect(successResult.data, isA<List<CoffeeModel>>());
      expect(successResult.data.length, greaterThan(0));
    },
  );
}
