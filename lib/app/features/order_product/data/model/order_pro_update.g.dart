// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_pro_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProUpdate _$OrderProUpdateFromJson(Map<String, dynamic> json) =>
    OrderProUpdate(
      customQuantity: json['custom_quantity'] as num,
      customPrice: json['custom_price'] as num,
    );

Map<String, dynamic> _$OrderProUpdateToJson(OrderProUpdate instance) =>
    <String, dynamic>{
      'custom_quantity': instance.customQuantity,
      'custom_price': instance.customPrice,
    };
