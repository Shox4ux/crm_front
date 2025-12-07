import 'package:crm_app/app/new/common/data/repo/data_state.dart';

import '../../../models/request/warehouse/warehouse_write.dart';
import '../../../models/response/del_read.dart';
import '../../../models/response/warehouse/warehouse_read.dart';

abstract class WarehouseRepoImpl {
  Future<DataState<WarehouseRead>> createWarehouse({
    required WarehouseWrite body,
  });
  Future<DataState<DelRead>> deleteWarehouse({required int id});
  Future<DataState<List<WarehouseRead>>> getAllWarehouse();
  Future<DataState<WarehouseRead>> getWarehouse({required int id});
}
