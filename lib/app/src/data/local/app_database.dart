import 'package:drift/drift.dart';
import 'daos/client_dao/client_dao.dart';
import 'daos/product_dao/product_dao.dart';
import 'daos/warehouse_dao/warehouse_dao.dart';
import 'connection/database_connection.dart';
part 'app_database.g.dart';

mixin TableMixin on Table {
  late final id = integer().autoIncrement()();
  late final createdAt = dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('ProductTable')
class Products extends Table with TableMixin {
  TextColumn get name => text().withLength(max: 220)();
  TextColumn get imgUrl => text().withLength(max: 320).nullable()();
  RealColumn get buyPrice => real()();
  RealColumn get sellPrice => real()();
}

@DataClassName('WarehouseProductTable')
class WarehouseProducts extends Table with TableMixin {
  IntColumn get quantity => integer()();
  IntColumn get productStatus => integer()();
  IntColumn get warehouseId => integer().references(Warehouses, #id)();
  IntColumn get productId => integer().references(Products, #id)();
}

@DataClassName('WarehouseTable')
class Warehouses extends Table with TableMixin {
  TextColumn get name => text()();
  TextColumn get address => text()();
}

@DataClassName('ClientTable')
class Clients extends Table with TableMixin {
  TextColumn get fullname => text().withLength(max: 220)();
  TextColumn get phone => text().withLength(max: 220).nullable()();
  TextColumn get address => text().withLength(max: 220).nullable()();
  TextColumn get secretKey => text().withLength(max: 220)();
}

@DataClassName('ClientProductTable')
class ClientProducts extends Table with TableMixin {
  RealColumn get specialPrice => real()();
  IntColumn get clientId => integer().references(Clients, #id)();
  IntColumn get warehouseProductId =>
      integer().references(WarehouseProducts, #id)();
}

@DataClassName('OrderTable')
class Orders extends Table with TableMixin {
  RealColumn get totalAmount => real()();
  RealColumn get paidAmount => real().withDefault(const Constant(0.0))();
  IntColumn get orderStatus => integer()();
  IntColumn get clientId => integer().references(Clients, #id)();
}

@DataClassName('OrderProductTable')
class OrderProducts extends Table with TableMixin {
  RealColumn get customPrice => real()();
  IntColumn get customQuantity => integer()();
  IntColumn get orderId => integer().references(Orders, #id)();
  IntColumn get warehouseProductId =>
      integer().references(WarehouseProducts, #id)();
}

@DataClassName('AdminTable')
class Admins extends Table with TableMixin {
  TextColumn get secretName => text().withLength(max: 220)();
  TextColumn get secretKey => text().withLength(max: 220)();
  IntColumn get adminPermission => integer()();
}

@DriftDatabase(
  tables: [
    Warehouses,
    Clients,
    Products,
    WarehouseProducts,

    ClientProducts,
    Orders,
    OrderProducts,
    Admins,
  ],
  daos: [WarehouseDao, ProductDao, ClientDao],
)
class Database extends _$Database {
  Database() : super(openConnection());

  @override
  int get schemaVersion => 1;
}
