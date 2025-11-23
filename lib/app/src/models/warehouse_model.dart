import 'package:crm_app/app/src/models/product_model.dart';

class Warehouse {
  final int? id;
  final String? name;
  final String? location;
  final List<Product>? productList;
  final DateTime? createdAt;

  Warehouse({
    this.id,
    this.name,
    this.location,
    this.createdAt,
    this.productList,
  });

  factory Warehouse.fake({
    String? name,
    String? location,
    List<Product>? list,
  }) {
    return Warehouse(name: name, location: location);
  }
}

List<Warehouse> warehouseList = [
  Warehouse.fake(name: "Sklad_A", location: "Samarqand", list: productL),
  Warehouse.fake(name: "Sklad_B", location: "Buxoro", list: productL),
  Warehouse.fake(name: "Sklad_A", location: "Samarqand", list: productL),
  Warehouse.fake(name: "Sklad_B", location: "Buxoro", list: productL),
  Warehouse.fake(name: "Sklad_A", location: "Samarqand", list: productL),
  Warehouse.fake(name: "Sklad_B", location: "Buxoro", list: productL),
];
