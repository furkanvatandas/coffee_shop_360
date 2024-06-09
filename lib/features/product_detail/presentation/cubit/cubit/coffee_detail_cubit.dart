import 'package:coffee_shop_360/core/models/process_status.dart';
import 'package:coffee_shop_360/features/home/data/models/coffee_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee_detail_state.dart';
part 'coffee_detail_cubit.freezed.dart';

class CoffeeDetailCubit extends Cubit<CoffeeDetailState> {
  final CoffeeModel? coffeeModel;

  CoffeeDetailCubit(this.coffeeModel)
      : super(
          CoffeeDetailState(
            pageStatus: ProcessStatusSuccess(),
            coffeeModel: coffeeModel,
          ),
        );
}
