import '../../app_database.dart';
import 'package:drift/drift.dart';

part 'client_dao.g.dart';

@DriftAccessor(tables: [Clients, ClientProducts, Orders, OrderProducts])
class ClientDao extends DatabaseAccessor<Database> with _$ClientDaoMixin {
  ClientDao(super.db);


  // Future<List<ClientWithOrders>> getClietWithOrders() async {
  //   final clientL = await select(clients).get();
  //   List<OrderWithProducts> result = [];
  //   List<OrderTable> orderL = [];

  //   for (var c in clientL) {
  //     orderL = await (select(
  //       orders,
  //     )..where((o) => o.clientId.equals(c.id))).get();
  //   }

  //   for (var o in orderL) {

  //   }
  // }

  // Future<List<WarehouseWithProducts>> getWarehousesWithProducts() async {
  //   final warehouses = await select(warehouses).get();
  //   final result = <WarehouseWithProducts>[];
  //   for (final wh in warehouses) {
  //     // Get warehouseProducts joined with product for each warehouse
  //     final query = select(warehouseProducts).join([
  //       innerJoin(products, products.id.equalsExp(warehouseProducts.productId)),
  //     ])
  //       ..where(warehouseProducts.warehouseId.equals(wh.id));
  //     final rows = await query.get();
  //     final whProducts = rows.map((row) {
  //       return WarehouseProductWithProduct(
  //         row.readTable(warehouseProducts),
  //         row.readTable(products),
  //       );
  //     }).toList();
  //     result.add(WarehouseWithProducts(wh, whProducts));
  //   }
  //   return result;
  // }

  Future<int> insertClient(ClientsCompanion entry) async =>
      await into(clients).insert(entry);

  Future<int> deleteWarehouse(int id) async =>
      await (delete(clients)..where((w) => w.id.equals(id))).go();
}
