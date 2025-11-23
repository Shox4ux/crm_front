import '../../../models/request/order/order_bulk_write.dart';
import '../../../models/request/order/order_prod_updt.dart';
import '../../base_repo/data_state.dart';

abstract class OrderProductRepoImpl {
  Future<DataState<dynamic>> createOrderProds({
    required OrderProdBulkWrite body,
  });
  Future<DataState<dynamic>> deleteOrderProd({required int id});
  Future<DataState<dynamic>> updateOrderProd({
    required int id,
    required OrderProdUpdt body,
  });
}
