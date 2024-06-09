import 'package:coffee_shop_360/core/managers/network/network_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'coffee_model.g.dart';

@JsonSerializable()
class CoffeeModel extends Equatable implements INetworkModel {
  final int? id;
  final double? price;
  final String? title;
  final String? description;
  final String? image;
  final List<String>? ingredients;

  const CoffeeModel({
    this.id,
    this.price,
    this.title,
    this.description,
    this.image,
    this.ingredients,
  });

  String? get coffeeIngredients => ingredients?.join(",");

  factory CoffeeModel.fromJson(Map<String, dynamic> json) => _$CoffeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoffeeModelToJson(this);

  @override
  fromJson(Map<String, dynamic> map) => _$CoffeeModelFromJson(map);

  @override
  List<Object?> get props => [
        id,
        price,
        title,
        description,
        image,
        ingredients,
      ];
}
