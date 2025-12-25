import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/warehouse/data/model/warehouse_create.dart';
import 'package:crm_app/app/features/warehouse/data/model/warehouse_response.dart';

abstract class WarehouseRepoImpl {
  Future<DataState<WarehouseResponse>> createWarehouse({
    required WarehouseCreate body,
  });
  Future<DataState> deleteWarehouse({required int id});
  Future<DataState<List<WarehouseResponse>>> getAllWarehouse();
  Future<DataState<WarehouseResponse>> getWarehouse({required int id});
}
