enum ProductStatus { sold, exist, onTheWay }

class Product {
  final int? id;
  final String name;
  final ProductStatus status;
  final double sellPrice;
  final double buyPrice;
  final DateTime? createdAt;

  Product({
    this.sellPrice = 0,
    this.buyPrice = 0,
    this.id,
    this.name = "",
    this.status = ProductStatus.exist,
    this.createdAt,
  });

  factory Product.fake({
    String name = "",
    ProductStatus type = ProductStatus.exist,
    double sellPrice = 0,
    double buyPrice = 0,
  }) {
    return Product(
      name: name,
      status: type,
      sellPrice: sellPrice,
      buyPrice: buyPrice,
    );
  }
}

List<Product> productL = [
  Product.fake(
    name: "Product_1",
    type: ProductStatus.onTheWay,
    sellPrice: 1200,
    buyPrice: 1000,
  ),
  Product.fake(
    name: "Product_2",
    type: ProductStatus.exist,
    sellPrice: 1600,
    buyPrice: 1300,
  ),
  Product.fake(
    name: "Product_3",
    type: ProductStatus.exist,
    sellPrice: 2000,
    buyPrice: 1500,
  ),
];
