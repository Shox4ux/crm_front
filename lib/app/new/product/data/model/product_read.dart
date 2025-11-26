// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:crm_app/app/src/data/remote/models/response/product/product_expense_read.dart';

part 'product_read.g.dart';

@JsonSerializable()
class ProductRead {
  final int id;
  final String name;
  final String? imgUrl;
  final double basePrice;
  final double sellPrice;
  final List<ProductExpenseRead>? base_expenses;
  final int? measure;
  final int total_quantity;
  final int active_quantity;
  final DateTime createdAt;
  ProductRead(
    this.measure,
    this.total_quantity,
    this.active_quantity, {
    required this.id,
    required this.name,
    this.imgUrl,
    required this.basePrice,
    required this.sellPrice,
    this.base_expenses,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => _$ProductReadToJson(this);

  factory ProductRead.fromJson(Map<String, dynamic> map) =>
      _$ProductReadFromJson(map);

  Map<String, dynamic> toMap() => _$ProductReadToJson(this);

  factory ProductRead.fromMap(Map<String, dynamic> map) =>
      _$ProductReadFromJson(map);
}
