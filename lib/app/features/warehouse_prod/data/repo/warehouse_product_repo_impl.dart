import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/warehouse_prod/data/model/ware_pro_create.dart';
import 'package:crm_app/app/features/warehouse_prod/data/model/ware_pro_response.dart';

abstract class WarehouseProductRepoImpl {
  Future<DataState> createWarehouseProduct({required WareProCreate body});
  Future<DataState> deleteWarehouseProduct({required int id});
  Future<DataState<List<WareProResponse>>> getAllWarehouseProduct();
  Future<DataState<List<WareProResponse>>> getAllWarehouseProductByWareId({
    required int wareId,
  });
  Future<DataState<WareProResponse>> getWarehouseProduct({required int id});
}
