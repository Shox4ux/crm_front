// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_prod_updt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProdUpdt _$OrderProdUpdtFromJson(Map<String, dynamic> json) =>
    OrderProdUpdt(
      customQuantity: json['custom_quantity'] as num,
      customPrice: json['custom_price'] as num,
    );

Map<String, dynamic> _$OrderProdUpdtToJson(OrderProdUpdt instance) =>
    <String, dynamic>{
      'custom_quantity': instance.customQuantity,
      'custom_price': instance.customPrice,
    };
