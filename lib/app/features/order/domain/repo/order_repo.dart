import 'package:crm_app/app/features/common/data/repo/base_repo.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/order/data/model/order_create.dart';
import 'package:crm_app/app/features/order/data/model/order_response.dart';
import 'package:crm_app/app/features/order/data/repo/order_repo_impl.dart';
import 'package:crm_app/app/features/order/data/source/order_api_service.dart';

class OrderRepo extends BaseRepo implements OrderRepoImpl {
  OrderRepo(this._service);
  final OrderApiService _service;

  @override
  Future<DataState<OrderResponse>> createOrder({required OrderCreate body}) =>
      getStateOf<OrderResponse>(
        request: () => _service.createOrder(body: body),
      );

  @override
  Future<DataState> deleteOrder({required int id}) =>
      getStateOf(request: () => _service.deleteOrder(id: id));

  @override
  Future<DataState<List<OrderResponse>>> getAllOrder() =>
      getStateOf<List<OrderResponse>>(request: () => _service.getAllOrder());

  @override
  Future<DataState<OrderResponse>> getOrderById({required int id}) =>
      getStateOf<OrderResponse>(request: () => _service.getOrderById(id: id));

  @override
  Future<DataState> updateOrder({required OrderCreate body, required int id}) =>
      getStateOf(
        request: () => _service.updateOrder(id: id, body: body),
      );
}
