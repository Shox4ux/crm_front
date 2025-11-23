import 'package:crm_app/app/src/data/remote/models/response/order/order_prod_read.dart';

extension GetTotal on List<OrderProdRead>? {
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
