import 'package:dio/dio.dart';

class ProductCreate {
  final MultipartFile? img;
  final String? name;
  final double? basePrice;
  final double? sellPrice;
  final int? measure;
  final int? totalQuantity;

  ProductCreate({
    this.img,
    required this.name,
    required this.basePrice,
    required this.sellPrice,
    this.measure,
    required this.totalQuantity,
  });

  factory ProductCreate.fromMap(Map<String, dynamic> map) {
    return ProductCreate(
      img: map['img'],
      name: map['name'] != null ? map['name'] as String : null,
      basePrice: map['basePrice'] != null ? map['basePrice'] as double : null,
      sellPrice: map['sellPrice'] != null ? map['sellPrice'] as double : null,
      measure: map['measure'] != null ? map['measure'] as int : null,
      totalQuantity: map['totalQuantity'] != null
          ? map['totalQuantity'] as int
          : null,
    );
  }
}
