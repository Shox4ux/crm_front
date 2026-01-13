import 'package:crm_app/app/features/product/data/model/product_response.dart';
import 'package:crm_app/app/features/warehouse_prod/domain/entity/ware_pro_entitiy.dart';

class WareProFake {
  final _list = <WareProEntitiy>[];

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

  WareProFake() {
    _list.addAll(
      prodList.map(
        (e) => WareProEntitiy(
          id: 1,
          product: e,
          warehouseId: 1,
          status: e.id,
          arrivesAt: DateTime.now(),
          quantity: 100 * e.id,
        ),
      ),
    );
  }

  List<WareProEntitiy> data() => _list;
  void addWP(WareProEntitiy data) {
    _list.add(data);
  }
}
