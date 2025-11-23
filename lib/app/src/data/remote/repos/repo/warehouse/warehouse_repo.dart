import '../../../models/request/warehouse/warehouse_write.dart';
import '../../../models/response/del_read.dart';
import '../../../models/response/warehouse/warehouse_read.dart';
import '../../base_repo/base_repo.dart';
import '../../base_repo/data_state.dart';
import 'warehouse_repo_impl.dart';
import '../../../service/api_service.dart';

class WarehouseRepo extends BaseRepo implements WarehouseRepoImpl {
  final ApiService _service;

  WarehouseRepo(this._service);

  @override
  Future<DataState<WarehouseRead>> createWarehouse({
    required WarehouseWrite body,
  }) => getStateOf<WarehouseRead>(
    request: () => _service.createWarehouse(body: body),
  );

  @override
  Future<DataState<DelRead>> deleteWarehouse({required int id}) =>
      getStateOf<DelRead>(request: () => _service.deleteWarehouse(id: id));

  @override
  Future<DataState<List<WarehouseRead>>> getAllWarehouse() =>
      getStateOf<List<WarehouseRead>>(
        request: () => _service.getAllWarehouse(),
      );

  @override
  Future<DataState<WarehouseRead>> getWarehouse({required int id}) =>
      getStateOf<WarehouseRead>(
        request: () => _service.getWarehouseById(id: id),
      );
}
