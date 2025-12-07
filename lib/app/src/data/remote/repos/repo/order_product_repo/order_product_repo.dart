import 'package:crm_app/app/new/common/data/repo/base_repo.dart';
import 'package:crm_app/app/new/common/data/repo/data_state.dart';
import '../../../models/request/order/order_bulk_write.dart';
import '../../../models/request/order/order_prod_updt.dart';
import 'order_product_repo_impl.dart';
import '../../../service/api_service.dart';

class OrderProductRepo extends BaseRepo implements OrderProductRepoImpl {
  final ApiService _service;
  OrderProductRepo(this._service);
  @override
  Future<DataState> createOrderProds({required OrderProdBulkWrite body}) =>
      getStateOf(request: () => _service.createOrderProd(body: body));

  @override
  Future<DataState> deleteOrderProd({required int id}) =>
      getStateOf(request: () => _service.deleteOrderProd(id: id));

  @override
  Future<DataState> updateOrderProd({
    required int id,
    required OrderProdUpdt body,
  }) => getStateOf(
    request: () => _service.updateOrderProd(id: id, body: body),
  );
}
