import 'package:coffee_shop_360/core/managers/network/models/failure_model.dart';
import 'package:coffee_shop_360/core/managers/network/network_result.dart';
import 'package:coffee_shop_360/features/home/data/models/coffee_model.dart';
import 'package:coffee_shop_360/features/home/domain/repositories/home_repository.dart';
import 'package:coffee_shop_360/features/home/domain/usecases/get_all_coffees.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../sample_data.dart';
import 'get_all_coffees_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  group('GetAllCoffeesUseCase Tests', () {
    late MockHomeRepository mockHomeRepository;
    late GetAllCoffeesUseCase getAllCoffeesUseCase;

    setUp(() {
      mockHomeRepository = MockHomeRepository();
      getAllCoffeesUseCase = GetAllCoffeesUseCase(mockHomeRepository);

      provideDummy<NetworkResult<List<CoffeeModel?>, FailureModel>>(
        NetworkResultSuccess<List<CoffeeModel?>, FailureModel>(SampleTestData.coffeeModelList),
      );
    });

    test('call returns a list of CoffeeModel on success', () async {
      // Arrange
      final coffeeList = SampleTestData.coffeeModelList;
      final networkResult = NetworkResultSuccess<List<CoffeeModel?>, FailureModel>(coffeeList);

      when(mockHomeRepository.getAllCoffees()).thenAnswer((_) async => networkResult);

      // Act
      final result = await getAllCoffeesUseCase();

      // Assert
      expect(result, isA<NetworkResultSuccess>());
      final successResult = result as NetworkResultSuccess<List<CoffeeModel?>, FailureModel>;
      expect(successResult.data, isA<List<CoffeeModel>>());
      expect(successResult.data.length, greaterThan(0));

      // Verify
      verify(mockHomeRepository.getAllCoffees()).called(1);
    });

    test('call returns a failure on error', () async {
      // Arrange
      const failureModel = FailureModel(errorMessage: 'Error occurred');
      final networkResult = NetworkResultFailure<List<CoffeeModel?>, FailureModel>(failureModel);

      when(mockHomeRepository.getAllCoffees()).thenAnswer((_) async => networkResult);

      // Act
      final result = await getAllCoffeesUseCase();

      // Assert
      expect(result, isA<NetworkResultFailure>());
      final failureResult = result as NetworkResultFailure<List<CoffeeModel?>, FailureModel>;
      expect(failureResult.failure, failureModel);

      // Verify
      verify(mockHomeRepository.getAllCoffees()).called(1);
    });
  });
}
