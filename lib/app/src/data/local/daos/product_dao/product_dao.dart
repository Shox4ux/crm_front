import '../../app_database.dart';
import 'package:drift/drift.dart';

part 'product_dao.g.dart';

@DriftAccessor(tables: [Products])
class ProductDao extends DatabaseAccessor<Database> with _$ProductDaoMixin {
  ProductDao(super.db);

  Future<int> insertProduct(ProductsCompanion entry) async =>
      await into(products).insert(entry);

  Future<int> deleteProduct(int id) async =>
      await (delete(products)..where((p) => p.id.equals(id))).go();

  Future<ProductTable> getById(int id) async =>
      await (select(products)..where((p) => p.id.equals(id))).getSingle();

  Future<List<ProductTable>> getProductTable() async =>
      await select(products).get();
}
