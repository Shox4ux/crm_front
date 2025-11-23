import 'package:crm_app/app/src/models/warehouse_product.dart';

class OrderProduct {
  final int? id;
  final WarehouseProduct? warehouseProduct;
  final num? soldPrice;
  final num? soldQuantity;
  final DateTime? soldAt;

  OrderProduct({
    this.id,
    this.warehouseProduct,
    this.soldPrice,
    this.soldQuantity,
    this.soldAt,
  });

  factory OrderProduct.fake({
    double soldPrice = 0,
    int soldQuantity = 0,
    WarehouseProduct? product,
  }) {
    return OrderProduct(
      soldPrice: soldPrice,
      soldQuantity: soldQuantity,
      warehouseProduct: product,
    );
  }
}

List<OrderProduct> salesList = [
  // OrderProduct.fake(
  //   soldPrice: 1300,
  //   soldQuantity: 100,
  //   product: wareProList[0],
  // ),
  // OrderProduct.fake(
  //   soldPrice: 1500,
  //   soldQuantity: 100,
  //   product: wareProList[0],
  // ),
  // OrderProduct.fake(
  //   soldPrice: 1800,
  //   soldQuantity: 100,
  //   product: wareProList[0],
  // ),
  // OrderProduct.fake(
  //   soldPrice: 1500,
  //   soldQuantity: 100,
  //   product: wareProList[0],
  // ),
];

extension GetTotalPrice on List<OrderProduct> {
  double getTotalPrice() {
    double total = 0.0;
    forEach((item) {
      total = total + item.soldPrice! * item.soldQuantity!;
      print(total);
    });
    return 0;
  }
}
