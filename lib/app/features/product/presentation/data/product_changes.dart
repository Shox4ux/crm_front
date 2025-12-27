// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_bulk_update.dart';

class ProductChanges {
  int? totalQty;
  int? activeQty;
  String? name;
  double? sellPrice;
  double? basePrice;
  MultipartFile? img;
  List<ProdItemUp>? updated;
  NewExp? newExp;
  List<int>? deleted;
  ProductChanges({
    this.totalQty,
    this.activeQty,
    this.name,
    this.sellPrice,
    this.basePrice,
    this.img,
    this.updated,
    this.deleted,
    this.newExp,
  });

  ProductChanges copyWith({
    int? totalQty,
    int? activeQty,
    String? name,
    double? sellPrice,
    double? basePrice,
    MultipartFile? img,
    List<ProdItemUp>? updated,
    NewExp? newExp,
    List<int>? deleted,
  }) {
    return ProductChanges(
      totalQty: totalQty ?? this.totalQty,
      activeQty: activeQty ?? this.activeQty,
      name: name ?? this.name,
      sellPrice: sellPrice ?? this.sellPrice,
      basePrice: basePrice ?? this.basePrice,
      img: img ?? this.img,
      updated: updated ?? this.updated,
      newExp: newExp ?? this.newExp,
      deleted: deleted ?? this.deleted,
    );
  }

  bool isNotEmpty() =>
      !(this.newExp == null && this.deleted == null && this.updated == null);

  ProductChanges setQty(int qty) =>
      this.copyWith(totalQty: qty, activeQty: qty);

  ProductChanges setName(String? name) => this.copyWith(name: name);

  ProductChanges setSellPrice(double? sellPice) =>
      this.copyWith(sellPrice: sellPice);

  ProductChanges setBasePrice(double? basePrice) =>
      this.copyWith(basePrice: basePrice);

  ProductChanges setImage(MultipartFile? img) => this.copyWith(img: img);
  ProductChanges setNewList(int productId, List<NewExpItem>? list) =>
      this.copyWith(
        newExp: NewExp(productId: productId, items: list),
      );
  ProductChanges setUpdatedList(List<ProdItemUp>? list) =>
      this.copyWith(updated: list);
  ProductChanges setDeletedList(List<int>? list) =>
      this.copyWith(deleted: list);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalQuantity': totalQty,
      'activeQuantity': activeQty,
      'name': name,
      'sellPrice': sellPrice,
      'basePrice': basePrice,
      'img': img,
      'update_exps': updated?.map((x) => x.toMap()).toList(),
      'new_exp': newExp?.toMap(),
      'removed': deleted,
    };
  }
}

class ProdItemUp {
  int? id;
  String? name;
  double? amount;
  ProdItemUp({this.id, this.name, this.amount});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'amount': amount};
  }

  factory ProdItemUp.fromMap(Map<String, dynamic> map) {
    return ProdItemUp(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      amount: map['amount'] != null ? map['amount'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdItemUp.fromJson(String source) =>
      ProdItemUp.fromMap(json.decode(source) as Map<String, dynamic>);

  ProdItemUp copyWith({int? id, String? name, double? amount}) {
    return ProdItemUp(
      id: id ?? this.id,
      name: name ?? this.name,
      amount: amount ?? this.amount,
    );
  }
}

class ProdItemNew {
  String? name;
  double? amount;
  ProdItemNew({this.name, this.amount});

  ProdItemNew copyWith({String? name, double? amount}) {
    return ProdItemNew(name: name ?? this.name, amount: amount ?? this.amount);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'amount': amount};
  }

  factory ProdItemNew.fromMap(Map<String, dynamic> map) {
    return ProdItemNew(
      name: map['name'] != null ? map['name'] as String : null,
      amount: map['amount'] != null ? map['amount'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdItemNew.fromJson(String source) =>
      ProdItemNew.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProdItemNew(name: $name, amount: $amount)';

  @override
  bool operator ==(covariant ProdItemNew other) {
    if (identical(this, other)) return true;

    return other.name == name && other.amount == amount;
  }

  @override
  int get hashCode => name.hashCode ^ amount.hashCode;
}
