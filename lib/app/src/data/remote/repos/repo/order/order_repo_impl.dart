import 'package:crm_app/app/features/common/data/repo/data_state.dart';

import '../../../models/request/order/order_write.dart';
import '../../../models/response/del_read.dart';
import '../../../models/response/order/order_read.dart';

abstract class OrderRepoImpl {
  Future<DataState<OrderRead>> createOrder({required OrderWrite body});
  Future<DataState<OrderRead>> updateOrder({
    required OrderWrite body,
    required int id,
  });
  Future<DataState<DelRead>> deleteOrder({required int id});
  Future<DataState<List<OrderRead>>> getAllOrder();
  Future<DataState<OrderRead>> getOrderById({required int id});
}
