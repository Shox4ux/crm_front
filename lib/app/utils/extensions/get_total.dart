import 'package:crm_app/app/features/order_prod/data/model/order_pro_response.dart';

extension GetTotal on List<OrderProResponse>? {
  String getTotal() {
    num t = 0;
    if (this != null) {
      for (var i in this!) {
        t += i.customPrice * i.customQuantity;
      }
      return t.toString();
    } else {
      return "0";
    }
  }
}
