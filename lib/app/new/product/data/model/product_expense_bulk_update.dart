import 'package:json_annotation/json_annotation.dart';

part 'product_expense_bulk_update.g.dart';

@JsonSerializable()
class ProdExpBulkUpdate {
  @JsonKey(defaultValue: null)
  final NewExp? newExp;
  @JsonKey(defaultValue: [])
  final List<UpdatedExp>? updateExps;
  @JsonKey(defaultValue: [])
  final List<int>? removed;

  ProdExpBulkUpdate({
    required this.newExp,
    required this.updateExps,
    required this.removed,
  });

  Map<String, dynamic> toJson() => _$ProdExpBulkUpdateToJson(this);

  factory ProdExpBulkUpdate.fromJson(Map<String, dynamic> map) =>
      _$ProdExpBulkUpdateFromJson(map);

  Map<String, dynamic> toMap() => _$ProdExpBulkUpdateToJson(this);

  factory ProdExpBulkUpdate.fromMap(Map<String, dynamic> map) =>
      _$ProdExpBulkUpdateFromJson(map);
}

@JsonSerializable()
class UpdatedExp {
  int id;
  String name;
  double amount;
  UpdatedExp({required this.id, required this.name, required this.amount});

  Map<String, dynamic> toJson() => _$UpdatedExpToJson(this);

  factory UpdatedExp.fromJson(Map<String, dynamic> map) =>
      _$UpdatedExpFromJson(map);

  Map<String, dynamic> toMap() => _$UpdatedExpToJson(this);

  factory UpdatedExp.fromMap(Map<String, dynamic> map) =>
      _$UpdatedExpFromJson(map);
}

@JsonSerializable()
class NewExp {
  int productId;
  List<NewExpItem>? items;
  NewExp({required this.productId, required this.items});

  Map<String, dynamic> toJson() => _$NewExpToJson(this);

  factory NewExp.fromJson(Map<String, dynamic> map) => _$NewExpFromJson(map);

  Map<String, dynamic> toMap() => _$NewExpToJson(this);

  factory NewExp.fromMap(Map<String, dynamic> map) => _$NewExpFromJson(map);
}

@JsonSerializable()
class NewExpItem {
  String name;
  double amount;
  NewExpItem({required this.name, required this.amount});

  Map<String, dynamic> toJson() => _$NewExpItemToJson(this);

  factory NewExpItem.fromJson(Map<String, dynamic> map) =>
      _$NewExpItemFromJson(map);

  Map<String, dynamic> toMap() => _$NewExpItemToJson(this);

  factory NewExpItem.fromMap(Map<String, dynamic> map) =>
      _$NewExpItemFromJson(map);
}
