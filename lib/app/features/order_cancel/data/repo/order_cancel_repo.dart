import 'package:crm_app/app/features/common/data/repo/base_repo.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/order_cancel/data/model/order_cancel_create.dart';
import 'package:crm_app/app/features/order_cancel/data/source/order_cancel_api_service.dart';
import 'package:crm_app/app/features/order_cancel/domain/order_cancel_repo_impl.dart';

class OrderCancelRepo extends BaseRepo implements OrderCancelRepoImpl {
  final OrderCancelApiService _service;

  OrderCancelRepo(this._service);
  @override
  Future<DataState<dynamic>> cancelOrder({required OrderCancelCreate body}) =>
      getStateOf(request: () => _service.cancelOrder(body: body));
}
