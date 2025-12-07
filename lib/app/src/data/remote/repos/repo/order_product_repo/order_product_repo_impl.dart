import 'package:crm_app/app/features/common/data/repo/data_state.dart';

import '../../../models/request/order/order_bulk_write.dart';
import '../../../models/request/order/order_prod_updt.dart';

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
