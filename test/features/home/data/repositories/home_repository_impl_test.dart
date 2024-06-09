import 'package:coffee_shop_360/core/managers/network/models/failure_model.dart';
import 'package:coffee_shop_360/features/home/data/data_sources/home_data_source.dart';
import 'package:coffee_shop_360/features/home/data/models/coffee_model.dart';
import 'package:coffee_shop_360/features/home/data/repositories/home_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:coffee_shop_360/core/managers/network/network_result.dart';

import '../../../../sample_data.dart';
import 'home_repository_impl_test.mocks.dart';

@GenerateMocks([HomeDataSource])
void main() {
  group('HomeRepositoryImpl Tests', () {
    late MockHomeDataSource mockHomeDataSource;
    late HomeRepositoryImpl homeRepository;

    setUp(() {
      mockHomeDataSource = MockHomeDataSource();
      homeRepository = HomeRepositoryImpl(mockHomeDataSource);

      provideDummy<NetworkResult<List<CoffeeModel?>, FailureModel>>(
        NetworkResultSuccess<List<CoffeeModel?>, FailureModel>(SampleTestData.coffeeModelList),
      );
    });

    test('getAllCoffees returns a list of CoffeeModel on success', () async {
      // Arrange

      final networkResult = NetworkResultSuccess<List<CoffeeModel?>, FailureModel>(SampleTestData.coffeeModelList);

      when(mockHomeDataSource.fetchAllCoffees()).thenAnswer((_) async => networkResult);

      // Act
      final result = await homeRepository.getAllCoffees();

      // Assert
      expect(result, isA<NetworkResultSuccess>());
      final successResult = result as NetworkResultSuccess<List<CoffeeModel?>, FailureModel>;
      expect(successResult.data, isA<List<CoffeeModel>>());
      expect(successResult.data.length, greaterThan(0));

      // Verify
      verify(mockHomeDataSource.fetchAllCoffees()).called(1);
    });

    test('getAllCoffees returns a failure on error', () async {
      // Arrange
      const failureModel = FailureModel(errorMessage: 'Error occurred');
      final networkResult = NetworkResultFailure<List<CoffeeModel?>, FailureModel>(failureModel);

      when(mockHomeDataSource.fetchAllCoffees()).thenAnswer((_) async => networkResult);

      // Act
      final result = await homeRepository.getAllCoffees();

      // Assert
      expect(result, isA<NetworkResultFailure<List<CoffeeModel?>, FailureModel>>());
      final failureResult = result as NetworkResultFailure<List<CoffeeModel?>, FailureModel>;
      expect(failureResult.failure, failureModel);

      // Verify
      verify(mockHomeDataSource.fetchAllCoffees()).called(1);
    });
  });
}
