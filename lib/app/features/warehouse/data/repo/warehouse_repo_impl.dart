import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/warehouse/data/model/warehouse_create_update.dart';
import 'package:crm_app/app/features/warehouse/data/model/warehouse_response.dart';

abstract class WarehouseRepoImpl {
  Future<DataState<WarehouseResponse>> createWarehouse({
    required WarehouseCreateUpdate body,
  });
  Future<DataState> deleteWarehouse({required int id});
  Future<DataState<List<WarehouseResponse>>> getAllWarehouse();
  Future<DataState<WarehouseResponse>> getWarehouse({required int id});
  Future<DataState> updateWarehouse({
    required int id,
    required WarehouseCreateUpdate body,
  });
}
