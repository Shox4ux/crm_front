import '../../../remote/models/response/product/product_read.dart';
import '../../../remote/models/response/warehouse/warehouse_product_read.dart';
import '../../../remote/models/response/warehouse/warehouse_read.dart';
import 'package:drift/drift.dart';
import '../../app_database.dart';

part 'warehouse_dao.g.dart';

@DriftAccessor(tables: [Warehouses, WarehouseProducts, Products])
class WarehouseDao extends DatabaseAccessor<Database> with _$WarehouseDaoMixin {
  WarehouseDao(super.db);

  Future<int> insertWarehouse(WarehousesCompanion entry) =>
      into(warehouses).insert(entry);

  Future<int> deleteWarehouse(int id) =>
      (delete(warehouses)..where((w) => w.id.equals(id))).go();

  Future<List<WarehouseRead>> getWList() async {
    final row = await select(warehouses).get();
    final list = row.map((w) => WarehouseRead.fromJson(w.toJson())).toList();
    return list;
  }

  Future<List<WarehouseProductRead>> getWPList(int wId) async {
    final row = await select(warehouseProducts).get()
      ..where((wp) => wp.warehouseId == wId);

    final list = row
        .map((wp) => WarehouseProductRead.fromJson(wp.toJson()))
        .toList();
    return list;
  }

  Future<ProductRead> getProdById(int id) async {
    final p = await (select(
      products,
    )..where((p) => p.id.equals(id))).getSingle();

    return ProductRead.fromMap(p.toJson());
  }
  // Future<List<WarehouseRead>> getWList() async {
  //   // var wList = [];
  //   // var wpList = [];
  //   // var pList = [];

  //   // final query = await select(warehouses).join(joins);

  //   final results = await select(warehouses).join([
  //     leftOuterJoin(warehouseProducts, warehouseProducts.id.equalsExp(warehouses.)),
  //   ]).get();

  //   return results.map((row) {
  //     final entry = row.readTable(todos);
  //     final category = row.readTable(categories);
  //     return EntryWithCategory(entry, category);
  //   }).toList();
  // }

  // Stream<List<WarehouseRead>> watchWarehousesWithProducts() {
  //   final query = select(warehouses);

  //   var wList = [];
  //   var wpList = [];
  //   var pList = [];

  //   return query.watch().asyncMap((warehouseList) async {
  //     final result = await Future.wait(
  //       warehouseList.map((w) async {
  //         final products = await (select(
  //           warehouseProducts,
  //         )..where((wp) => wp.warehouseId.equals(w.id))).get();

  //         return WarehouseWithProducts(warehouse: w, products: products);
  //       }),
  //     );
  //     return result;
  //   });
  // }
}
