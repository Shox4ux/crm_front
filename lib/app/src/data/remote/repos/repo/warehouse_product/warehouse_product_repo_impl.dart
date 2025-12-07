import 'package:crm_app/app/features/common/data/repo/data_state.dart';

import '../../../models/request/warehouse/warehouse_product_write.dart';
import '../../../models/response/del_read.dart';
import '../../../models/response/warehouse/warehouse_product_read.dart';

abstract class WarehouseProductRepoImpl {
  Future<DataState<WarehouseProductRead>> createWarehouseProduct({
    required WarehouseProductWrite body,
  });
  Future<DataState<DelRead>> deleteWarehouseProduct({required int id});
  Future<DataState<List<WarehouseProductRead>>> getAllWarehouseProduct();

  Future<DataState<List<WarehouseProductRead>>> getAllWarehouseProductByWareId({
    required int wareId,
  });

  Future<DataState<WarehouseProductRead>> getWarehouseProduct({
    required int id,
  });
}
