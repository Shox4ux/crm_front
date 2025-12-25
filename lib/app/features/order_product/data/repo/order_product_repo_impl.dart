import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/order_product/data/model/order_pro_bulk_create.dart';
import 'package:crm_app/app/features/order_product/data/model/order_pro_update.dart';

abstract class OrderProductRepoImpl {
  Future<DataState> createOrderProds({required OrderProBulkCreate body});
  Future<DataState> deleteOrderProd({required int id});
  Future<DataState> updateOrderProd({
    required int id,
    required OrderProUpdate body,
  });
}
