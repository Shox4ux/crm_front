import 'package:crm_app/app/features/common/data/repo/base_repo.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/warehouse_prod/data/model/ware_pro_create.dart';
import 'package:crm_app/app/features/warehouse_prod/data/model/ware_pro_response.dart';
import 'package:crm_app/app/features/warehouse_prod/data/source/wp_api_service.dart';
import '../../data/repo/warehouse_product_repo_impl.dart';

class WareProRepo extends BaseRepo implements WarehouseProductRepoImpl {
  final WPApiService _service;

  WareProRepo(this._service);

  @override
  Future<DataState> createWarehouseProduct({required WareProCreate body}) =>
      getStateOf(request: () => _service.createWProduct(body: body));

  @override
  Future<DataState> deleteWarehouseProduct({required int id}) =>
      getStateOf(request: () => _service.deleteWProduct(id: id));

  @override
  Future<DataState<List<WareProResponse>>> getAllWarehouseProduct() =>
      getStateOf(request: () => _service.getAllWProduct());

  @override
  Future<DataState<List<WareProResponse>>> getAllWarehouseProductByWareId({
    required int wareId,
  }) => getStateOf(
    request: () => _service.getAllWProductByWareId(wareId: wareId),
  );

  @override
  Future<DataState<WareProResponse>> getWarehouseProduct({required int id}) =>
      getStateOf(request: () => _service.getWProductById(id: id));
}
