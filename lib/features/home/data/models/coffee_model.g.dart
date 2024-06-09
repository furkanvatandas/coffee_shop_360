// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoffeeModel _$CoffeeModelFromJson(Map<String, dynamic> json) => CoffeeModel(
      id: (json['id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CoffeeModelToJson(CoffeeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'ingredients': instance.ingredients,
    };
