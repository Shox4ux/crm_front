import 'package:crm_app/app/features/common/data/repo/base_repo.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';

import '../../../models/request/order/order_write.dart';
import '../../../models/response/del_read.dart';
import '../../../models/response/order/order_read.dart';
import 'order_repo_impl.dart';
import '../../../service/api_service.dart';

class OrderRepo extends BaseRepo implements OrderRepoImpl {
  OrderRepo(this._service);
  final ApiService _service;

  @override
  Future<DataState<OrderRead>> createOrder({required OrderWrite body}) =>
      getStateOf<OrderRead>(request: () => _service.createOrder(body: body));

  @override
  Future<DataState<DelRead>> deleteOrder({required int id}) =>
      getStateOf<DelRead>(request: () => _service.deleteOrder(id: id));

  @override
  Future<DataState<List<OrderRead>>> getAllOrder() =>
      getStateOf<List<OrderRead>>(request: () => _service.getAllOrder());

  @override
  Future<DataState<OrderRead>> getOrderById({required int id}) =>
      getStateOf<OrderRead>(request: () => _service.getOrderById(id: id));

  @override
  Future<DataState<OrderRead>> updateOrder({
    required OrderWrite body,
    required int id,
  }) => getStateOf<OrderRead>(
    request: () => _service.updateOrder(id: id, body: body),
  );
}
