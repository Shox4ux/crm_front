import '../../../models/request/warehouse/warehouse_product_write.dart';
import '../../../models/response/del_read.dart';
import '../../../models/response/warehouse/warehouse_product_read.dart';
import '../../base_repo/base_repo.dart';
import '../../base_repo/data_state.dart';
import 'warehouse_product_repo_impl.dart';
import '../../../service/api_service.dart';

class WarehouseProductRepo extends BaseRepo
    implements WarehouseProductRepoImpl {
  final ApiService _service;

  WarehouseProductRepo(this._service);

  @override
  Future<DataState<WarehouseProductRead>> createWarehouseProduct({
    required WarehouseProductWrite body,
  }) => getStateOf<WarehouseProductRead>(
    request: () => _service.createWProduct(body: body),
  );

  @override
  Future<DataState<DelRead>> deleteWarehouseProduct({required int id}) =>
      getStateOf<DelRead>(request: () => _service.deleteWProduct(id: id));

  @override
  Future<DataState<List<WarehouseProductRead>>> getAllWarehouseProduct() =>
      getStateOf<List<WarehouseProductRead>>(
        request: () => _service.getAllWProduct(),
      );

  @override
  Future<DataState<WarehouseProductRead>> getWarehouseProduct({
    required int id,
  }) => getStateOf<WarehouseProductRead>(
    request: () => _service.getWProductById(id: id),
  );
}
