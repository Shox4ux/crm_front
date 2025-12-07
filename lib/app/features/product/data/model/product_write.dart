// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';

class ProductWrite {
  final MultipartFile? img;
  final String? name;
  final double? basePrice;
  final double? sellPrice;
  final int? measure;
  final int? totalQuantity;
  final int? activeQuantity;

  ProductWrite({
    this.img,
    required this.name,
    required this.basePrice,
    required this.sellPrice,
    this.measure,
    required this.totalQuantity,
    required this.activeQuantity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'img': img,
      'name': name,
      'basePrice': basePrice,
      'sellPrice': sellPrice,
      'measure': measure,
      'totalQuantity': totalQuantity,
      'activeQuantity': activeQuantity,
    };
  }

  factory ProductWrite.fromMap(Map<String, dynamic> map) {
    return ProductWrite(
      img: map['img'],
      name: map['name'] != null ? map['name'] as String : null,
      basePrice: map['basePrice'] != null ? map['basePrice'] as double : null,
      sellPrice: map['sellPrice'] != null ? map['sellPrice'] as double : null,
      measure: map['measure'] != null ? map['measure'] as int : null,
      totalQuantity: map['totalQuantity'] != null
          ? map['totalQuantity'] as int
          : null,
      activeQuantity: map['activeQuantity'] != null
          ? map['activeQuantity'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductWrite.fromJson(String source) =>
      ProductWrite.fromMap(json.decode(source) as Map<String, dynamic>);
}
