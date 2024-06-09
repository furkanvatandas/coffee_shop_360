import 'package:coffee_shop_360/core/managers/network/network_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'failure_model.g.dart';

@JsonSerializable()
class FailureModel implements INetworkModel {
  final String? errorMessage;

  const FailureModel({this.errorMessage});

  factory FailureModel.fromJson(Map<String, dynamic> map) => _$FailureModelFromJson(map);

  @override
  FailureModel fromJson(Map<String, dynamic> map) => _$FailureModelFromJson(map);
}
