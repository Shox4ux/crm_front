import 'package:crm_app/app/features/common/data/repo/base_repo.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/order_product/data/model/order_pro_bulk_create.dart';
import 'package:crm_app/app/features/order_product/data/model/order_pro_update.dart';
import 'package:crm_app/app/features/order_product/data/source/order_pro_api_service.dart';
import '../../data/repo/order_product_repo_impl.dart';

class OrderProductRepo extends BaseRepo implements OrderProductRepoImpl {
  final OrderProApiService _service;
  OrderProductRepo(this._service);
  @override
  Future<DataState> createOrderProds({required OrderProBulkCreate body}) =>
      getStateOf(request: () => _service.createOrderProd(body: body));

  @override
  Future<DataState> deleteOrderProd({required int id}) =>
      getStateOf(request: () => _service.deleteOrderProd(id: id));

  @override
  Future<DataState> updateOrderProd({
    required int id,
    required OrderProUpdate body,
  }) => getStateOf(
    request: () => _service.updateOrderProd(id: id, body: body),
  );
}
