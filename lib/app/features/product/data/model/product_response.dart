import 'package:crm_app/app/features/product/domain/entity/product_entity.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse extends ProductEntity {
  ProductResponse({
    required super.id,
    required super.name,
    required super.imgUrl,
    required super.basePrice,
    required super.sellPrice,
    required super.baseExpenses,
    required super.measure,
    required super.totalQuantity,
    required super.activeQuantity,
    required super.createdAt,
  });

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);

  factory ProductResponse.fromJson(Map<String, dynamic> map) =>
      _$ProductResponseFromJson(map);
}
