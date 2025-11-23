import '../../../models/request/warehouse/warehouse_product_write.dart';
import '../../../models/response/del_read.dart';
import '../../../models/response/warehouse/warehouse_product_read.dart';
import '../../base_repo/data_state.dart';

abstract class WarehouseProductRepoImpl {
  Future<DataState<WarehouseProductRead>> createWarehouseProduct({
    required WarehouseProductWrite body,
  });
  Future<DataState<DelRead>> deleteWarehouseProduct({required int id});
  Future<DataState<List<WarehouseProductRead>>> getAllWarehouseProduct();
  Future<DataState<WarehouseProductRead>> getWarehouseProduct({
    required int id,
  });
}
