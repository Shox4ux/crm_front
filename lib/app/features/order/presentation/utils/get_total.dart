import 'package:crm_app/app/features/order_product/data/model/order_pro_response.dart';

double getTotal(List<OrderProResponse>? items) {
  if (items == null) return 0;
  return items.fold(0, (sum, i) => sum + i.total);
}
