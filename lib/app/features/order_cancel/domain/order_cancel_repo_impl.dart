import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/order_cancel/data/model/order_cancel_create.dart';

abstract class OrderCancelRepoImpl {
  Future<DataState> cancelOrder({required OrderCancelCreate body});
}
