import 'package:coffee_shop_360/core/models/process_status.dart';
import 'package:coffee_shop_360/core/theme/custom_colors.dart';
import 'package:coffee_shop_360/features/home/data/models/coffee_model.dart';
import 'package:coffee_shop_360/features/product_detail/presentation/components/coffee_description.dart';
import 'package:coffee_shop_360/features/product_detail/presentation/components/coffee_info.dart';
import 'package:coffee_shop_360/features/product_detail/presentation/components/coffee_price.dart';
import 'package:coffee_shop_360/features/product_detail/presentation/components/coffee_size.dart';
import 'package:coffee_shop_360/features/product_detail/presentation/cubit/cubit/coffee_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeDetail extends StatefulWidget {
  const CoffeeDetail({super.key});
  const CoffeeDetail._();

  static Route route(CoffeeModel? coffeeModel) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider(
        create: (_) => CoffeeDetailCubit(coffeeModel),
        child: const CoffeeDetail._(),
      ),
    );
  }

  @override
  State<CoffeeDetail> createState() => _CoffeeDetailState();
}

class _CoffeeDetailState extends State<CoffeeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
        ],
      ),
      body: BlocBuilder<CoffeeDetailCubit, CoffeeDetailState>(
        builder: (context, state) {
          switch (state.pageStatus) {
            case ProcessStatusSuccess():
              var title = state.coffeeModel?.title ?? '';
              var price = state.coffeeModel?.price.toString() ?? '';
              var image = state.coffeeModel?.image ?? '';
              var description = state.coffeeModel?.description ?? '';
              var coffeeIngredients = state.coffeeModel?.coffeeIngredients;

              return SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        children: [
                          CoffeeInfo(
                            title: title,
                            imagePath: image,
                            coffeeIngredients: coffeeIngredients,
                          ),
                          Divider(height: 40, color: CustomColors.greenWhite),
                          CoffeeDescription(description: description),
                          const SizedBox(height: 20),
                          const CoffeeSize(),
                        ],
                      ),
                    ),
                    CoffeePrice(price: price),
                  ],
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
