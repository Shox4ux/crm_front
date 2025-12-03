class ProdData {
  final String name;
  final double finalPrice;
  final int quantity;
  final String imgUrl;

  ProdData({
    required this.name,
    required this.finalPrice,
    required this.quantity,
    required this.imgUrl,
  });
}

List<ProdData> prodList = [
  ProdData(name: "name0", finalPrice: 150.3, quantity: 100, imgUrl: "imgUrl"),
  ProdData(name: "name1", finalPrice: 150.3, quantity: 100, imgUrl: "imgUrl"),
  ProdData(name: "name2", finalPrice: 150.3, quantity: 100, imgUrl: "imgUrl"),
  ProdData(name: "name3", finalPrice: 150.3, quantity: 100, imgUrl: "imgUrl"),
  ProdData(name: "name4", finalPrice: 150.3, quantity: 100, imgUrl: "imgUrl"),
  ProdData(name: "name5", finalPrice: 150.3, quantity: 100, imgUrl: "imgUrl"),
];
