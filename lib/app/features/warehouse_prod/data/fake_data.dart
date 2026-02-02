import 'package:crm_app/app/features/product/data/model/product_response.dart';

class WareProFake {
  static final List<ProductResponse> prodList = [
    ProductResponse(
      id: 1,
      name: 'Apple',
      imgUrl: '',
      basePrice: 20,
      sellPrice: 20,
      baseExpenses: [],
      measure: null,
      totalQuantity: 100,
      activeQuantity: 100,
      createdAt: DateTime.now(),
    ),
    ProductResponse(
      id: 2,
      name: 'Banana',
      imgUrl: '',
      basePrice: 35,
      sellPrice: 35,
      baseExpenses: [],
      measure: null,
      totalQuantity: 210,
      activeQuantity: 210,
      createdAt: DateTime.now(),
    ),
    ProductResponse(
      id: 3,
      name: 'Orange',
      imgUrl: '',
      basePrice: 32,
      sellPrice: 32,
      baseExpenses: [],
      measure: null,
      totalQuantity: 250,
      activeQuantity: 250,
      createdAt: DateTime.now(),
    ),
  ];
}
