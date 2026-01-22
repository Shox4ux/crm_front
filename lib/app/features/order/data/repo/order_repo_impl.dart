import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/order/data/model/order_create.dart';
import 'package:crm_app/app/features/order/data/model/order_response.dart';
import 'package:crm_app/app/features/order/data/model/order_update.dart';

abstract class OrderRepoImpl {
  Future<DataState> createOrder({required OrderCreate body});
  Future<DataState> updateOrder({required OrderUpdate body, required int id});
  Future<DataState> deleteOrder({required int id});
  Future<DataState<List<OrderResponse>>> getAllOrder();
  Future<DataState<OrderResponse>> getOrderById({required int id});
}
