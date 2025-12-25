import 'package:crm_app/app/features/common/data/repo/base_repo.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/warehouse/data/model/warehouse_create.dart';
import 'package:crm_app/app/features/warehouse/data/model/warehouse_response.dart';
import 'package:crm_app/app/features/warehouse/data/source/warehouse_api_service.dart';

import '../../data/repo/warehouse_repo_impl.dart';

class WarehouseRepo extends BaseRepo implements WarehouseRepoImpl {
  final WarehouseApiService _service;

  WarehouseRepo(this._service);

  @override
  Future<DataState<WarehouseResponse>> createWarehouse({
    required WarehouseCreate body,
  }) => getStateOf<WarehouseResponse>(
    request: () => _service.createWarehouse(body: body),
  );

  @override
  Future<DataState> deleteWarehouse({required int id}) =>
      getStateOf(request: () => _service.deleteWarehouse(id: id));

  @override
  Future<DataState<List<WarehouseResponse>>> getAllWarehouse() =>
      getStateOf<List<WarehouseResponse>>(
        request: () => _service.getAllWarehouse(),
      );

  @override
  Future<DataState<WarehouseResponse>> getWarehouse({required int id}) =>
      getStateOf<WarehouseResponse>(
        request: () => _service.getWarehouseById(id: id),
      );
}
