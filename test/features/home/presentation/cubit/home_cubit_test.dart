import 'package:bloc_test/bloc_test.dart';
import 'package:coffee_shop_360/core/managers/network/models/failure_model.dart';
import 'package:coffee_shop_360/core/models/process_status.dart';
import 'package:coffee_shop_360/features/home/data/models/coffee_model.dart';
import 'package:coffee_shop_360/features/home/domain/usecases/get_all_coffees.dart';
import 'package:coffee_shop_360/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:coffee_shop_360/core/managers/network/network_result.dart';
import '../../../../sample_data.dart';
import 'home_cubit_test.mocks.dart';

@GenerateMocks([GetAllCoffeesUseCase])
void main() {
  setUpAll(() {
    provideDummy<NetworkResult<List<CoffeeModel?>, FailureModel>>(
      NetworkResultSuccess<List<CoffeeModel?>, FailureModel>(SampleTestData.coffeeModelList),
    );
  });

  group('HomeCubit Tests', () {
    late MockGetAllCoffeesUseCase mockGetAllCoffeesUseCase;
    late HomeCubit homeCubit;

    setUp(() {
      mockGetAllCoffeesUseCase = MockGetAllCoffeesUseCase();
      homeCubit = HomeCubit(mockGetAllCoffeesUseCase);
    });

    blocTest<HomeCubit, HomeState>(
      'emits [ProcessStatusLoading, ProcessStatusSuccess] when getAllCoffees is successful',
      build: () {
        final coffeeList = SampleTestData.coffeeModelList;
        when(mockGetAllCoffeesUseCase()).thenAnswer((_) async => NetworkResultSuccess(coffeeList));
        return homeCubit;
      },
      act: (cubit) => cubit.getAllCoffees(),
      expect: () => [
        HomeState(pageStatus: ProcessStatusLoading(), coffeeList: []),
        HomeState(
          pageStatus: ProcessStatusSuccess(),
          coffeeList: SampleTestData.coffeeModelList,
          coffeeFilteredList: SampleTestData.coffeeModelList,
        )
      ],
      verify: (_) {
        verify(mockGetAllCoffeesUseCase()).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'emits [ProcessStatusLoading, ProcessStatusFailure] when getAllCoffees fails',
      build: () {
        when(mockGetAllCoffeesUseCase()).thenAnswer(
          (_) async => NetworkResultFailure(const FailureModel(errorMessage: 'Error occurred')),
        );
        return homeCubit;
      },
      act: (cubit) => cubit.getAllCoffees(),
      expect: () => [
        HomeState(pageStatus: ProcessStatusLoading(), coffeeList: []),
        HomeState(pageStatus: ProcessStatusFailure(), coffeeList: [])
      ],
      verify: (_) {
        verify(mockGetAllCoffeesUseCase()).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'filterCoffee with empty name returns full list',
      build: () => homeCubit,
      seed: () => HomeState(
        pageStatus: ProcessStatusSuccess(),
        coffeeList: [
          const CoffeeModel(title: 'Cappuccino'),
          const CoffeeModel(title: 'Machiatto'),
        ],
        coffeeFilteredList: [],
      ),
      act: (cubit) => cubit.searchCoffee(''),
      expect: () => [
        HomeState(
          pageStatus: ProcessStatusSuccess(),
          coffeeList: [
            const CoffeeModel(title: 'Cappuccino'),
            const CoffeeModel(title: 'Machiatto'),
          ],
          coffeeFilteredList: [
            const CoffeeModel(title: 'Cappuccino'),
            const CoffeeModel(title: 'Machiatto'),
          ],
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'filterCoffee with "cappuccino" returns one item',
      build: () => homeCubit,
      seed: () => HomeState(
        pageStatus: ProcessStatusSuccess(),
        coffeeList: [
          const CoffeeModel(title: 'Cappuccino'),
          const CoffeeModel(title: 'Machiatto'),
        ],
        coffeeFilteredList: [],
      ),
      act: (cubit) => cubit.searchCoffee('cappuccino'),
      expect: () => [
        HomeState(
          pageStatus: ProcessStatusSuccess(),
          coffeeList: [
            const CoffeeModel(title: 'Cappuccino'),
            const CoffeeModel(title: 'Machiatto'),
          ],
          coffeeFilteredList: [
            const CoffeeModel(title: 'Cappuccino'),
          ],
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'filterCoffee with "a" returns all items containing "a"',
      build: () => homeCubit,
      seed: () => HomeState(
        pageStatus: ProcessStatusSuccess(),
        coffeeList: [
          const CoffeeModel(title: 'Cappuccino'),
          const CoffeeModel(title: 'Machiatto'),
          const CoffeeModel(title: 'Latte'),
          const CoffeeModel(title: 'Americano'),
        ],
        coffeeFilteredList: [],
      ),
      act: (cubit) => cubit.searchCoffee('a'),
      expect: () => [
        HomeState(
          pageStatus: ProcessStatusSuccess(),
          coffeeList: [
            const CoffeeModel(title: 'Cappuccino'),
            const CoffeeModel(title: 'Machiatto'),
            const CoffeeModel(title: 'Latte'),
            const CoffeeModel(title: 'Americano'),
          ],
          coffeeFilteredList: [
            const CoffeeModel(title: 'Cappuccino'),
            const CoffeeModel(title: 'Machiatto'),
            const CoffeeModel(title: 'Latte'),
            const CoffeeModel(title: 'Americano'),
          ],
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'filterCoffee with "xyz" returns empty list',
      build: () => homeCubit,
      seed: () => HomeState(
        pageStatus: ProcessStatusSuccess(),
        coffeeList: [
          const CoffeeModel(title: 'Cappuccino'),
          const CoffeeModel(title: 'Machiatto'),
        ],
        coffeeFilteredList: [],
      ),
      act: (cubit) => cubit.searchCoffee('xyz'),
      expect: () => [],
    );
  });
}
