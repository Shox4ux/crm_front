import 'package:crm_app/app/src/data/remote/models/request/order/order_bulk_write.dart';
import 'package:crm_app/app/src/data/remote/models/request/order/order_prod_updt.dart';
import 'package:crm_app/app/src/data/remote/models/request/order/order_prod_write.dart';
import 'package:crm_app/app/src/data/remote/models/response/client/client_product_read.dart';
import 'package:crm_app/app/src/data/remote/models/response/client/client_read.dart';
import 'package:crm_app/app/src/data/remote/models/response/order/order_read.dart';
import 'package:crm_app/app/src/data/remote/models/response/warehouse/warehouse_product_read.dart';
import 'package:crm_app/app/src/data/remote/models/response/warehouse/warehouse_read.dart';
import 'package:crm_app/app/src/data/remote/repos/base_repo/data_state.dart';
import 'package:crm_app/app/src/screens/orders/data/order_row_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/remote/repos/repo/api_repos.dart';

part 'order_product_state.dart';

class OrderProdCubit extends Cubit<OrderProductState> {
  final WarehouseRepo _wRepo;
  final ClientRepo _cRepo;
  final OrderProductRepo _repo;
  OrderProdCubit(this._wRepo, this._cRepo, this._repo)
    : super(OrderProductState(status: OrProStatus.init, rowList: []));

  void emptyState() {
    emit(
      state.copyWith(
        wList: [],
        wpList: [],
        rList: [],
        slctClient: null,
        status: OrProStatus.init,
      ),
    );
  }

  void _createOrdProd(int ordId, OrderRowData row) async {
    var b = OrderProdBulkWrite(
      items: [
        OrderProdWrite(
          customPrice: row.customPrice,
          customQuantity: row.customQuantity,
          warehouseProductId: row.slctdWp!.id,
        ),
      ],
      orderId: ordId,
    );
    var res = await _repo.createOrderProds(body: b);
    if (res is DataFailed) {
      emit(state.copyWith(status: OrProStatus.error, msg: res.errorMsg));
      return;
    }
  }

  void _upOrdProd(int prodId, OrderRowData row) async {
    var b = OrderProdUpdt(
      customPrice: row.customPrice,
      customQuantity: row.customQuantity,
    );
    var res = await _repo.updateOrderProd(id: prodId, body: b);
    if (res is DataFailed) {
      emit(state.copyWith(status: OrProStatus.error, msg: res.errorMsg));
      return;
    }
  }

  Future<void> updateOrderProdList(OrderRead oldOrder) async {
    try {
      for (var up in state.rowList) {
        if (up.id == null) {
          _createOrdProd(oldOrder.id, up);
        } else {
          for (var o in oldOrder.orderProducts!) {
            if (o.id == up.id) {
              _upOrdProd(o.id, up);
            }
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void onEdit(OrderRead old) {
    emit(state.copyWith(slctClient: old.client, status: OrProStatus.onEdit));

    var l = old.orderProducts?.map((v) {
      var w = state.wList
          ?.where((w) => w.id == v.warehouseProduct.warehouseId)
          .first;
      return OrderRowData(
        id: v.id,
        wList: state.wList,
        wpList: w?.products,
        slctWare: w,
        slctdWp: v.warehouseProduct,
        customPrice: v.customPrice,
        customQuantity: v.customQuantity,
      );
    }).toList();

    emit(state.copyWith(rList: l, slctClient: old.client));
  }

  Future<void> setUpWL() async {
    print("setUp\n");

    emit(state.copyWith(status: OrProStatus.loading));
    var wL = await _wRepo.getAllWarehouse();
    var cL = await _cRepo.getAllClient();
    if (wL is DataSuccess && cL is DataSuccess) {
      emit(
        state.copyWith(
          wList: wL.data,
          status: OrProStatus.success,
          cList: cL.data,
        ),
      );
      print(state.slctClient?.user.username);
      print("wList ${state.wList?.length}");
      print("cList ${state.cList?.length}");
    } else {
      emit(state.copyWith(msg: wL.errorMsg, status: OrProStatus.error));
    }
  }

  void onSlctClient(ClientRead? c) {
    emit(state.copyWith(slctClient: c));
  }

  void addRow({int? id}) {
    emit(state.copyWith(status: OrProStatus.onAdd));
    try {
      var data = OrderRowData(
        id: id,
        customPrice: 0.0,
        customQuantity: 0,
        wList: state.wList,
      );
      var toUptd = state.rowList..add(data);
      emit(state.copyWith(status: OrProStatus.success, rList: toUptd));
    } catch (e) {
      emit(state.copyWith(status: OrProStatus.error, msg: e.toString()));
    }
  }

  Future<void> removeRow({int i = -1, OrderRowData? row}) async {
    emit(state.copyWith(status: OrProStatus.loading));
    try {
      if (row?.id != null) {
        var res = await _repo.deleteOrderProd(id: row!.id!);
        if (res is DataFailed) {
          emit(state.copyWith(status: OrProStatus.error, msg: res.errorMsg));
          return;
        }
      }
      var toUptd = state.rowList..removeAt(i);

      emit(state.copyWith(rList: toUptd, status: OrProStatus.success));
    } catch (e) {
      emit(state.copyWith(status: OrProStatus.error, msg: e.toString()));
    }
  }

  void updateRowQ({required int i, num? qVal}) {
    emit(state.copyWith(status: OrProStatus.loading));

    try {
      final toUptd = state.rowList;
      var upRow = toUptd[i].copyWith(customQuantity: qVal ?? 0);
      toUptd[i] = upRow;
      emit(state.copyWith(rList: toUptd, status: OrProStatus.success));
    } catch (e) {
      emit(state.copyWith(msg: e.toString(), status: OrProStatus.error));
    }
  }

  void updateRowP({required int i, num? pVal}) {
    emit(state.copyWith(status: OrProStatus.loading));

    try {
      final toUptd = state.rowList;
      var upRow = toUptd[i].copyWith(customPrice: pVal ?? 0);
      toUptd[i] = upRow;
      emit(state.copyWith(rList: toUptd, status: OrProStatus.success));
    } catch (e) {
      emit(state.copyWith(msg: e.toString(), status: OrProStatus.error));
    }
  }

  void onSlctWare(int i, WarehouseRead w) async {
    emit(state.copyWith(status: OrProStatus.loadingW, curRowIndex: i));

    try {
      // Create a new list
      var upRowList = List.of(state.rowList);
      // Update row
      var upRow = upRowList[i].copyWith(wpList: w.products, slctWare: w);
      // Replace old row
      upRowList[i] = upRow;
      emit(state.copyWith(rList: upRowList, status: OrProStatus.success));
    } catch (e) {
      emit(state.copyWith(msg: e.toString(), status: OrProStatus.error));
    }
  }

  void onSlctWP(int i, WarehouseProductRead wp) {
    emit(state.copyWith(status: OrProStatus.loadingWp, curRowIndex: i));
    ClientProductRead? cp;
    try {
      print(state.slctClient?.products?.length);
      print(wp.product?.id);

      for (var u in state.slctClient!.products!) {
        if (u.id == wp.product!.id) {
          cp = u;
        }
      }

      var rowList = state.rowList;

      var row = rowList[i].copyWith(
        slctdWp: wp,
        customPrice: cp?.customPrice,
        customQuantity: wp.quantity,
      );

      rowList[i] = row;
      emit(state.copyWith(rList: rowList, status: OrProStatus.success));
    } catch (e) {
      emit(state.copyWith(msg: e.toString(), status: OrProStatus.error));
    }
  }

  String sumUp(int i) {
    var row = state.rowList[i];
    print(row.customPrice);
    print(row.customQuantity);
    return (row.customPrice * row.customQuantity).toString();
  }

  num totalAmount() {
    final orderL = state.rowList;
    if (orderL.isEmpty) return 0;
    num t = 0;
    for (var i in orderL) {
      t = t + i.customPrice * i.customQuantity;
    }
    return t;
  }

  Future<void> createOrderList(int orderId) async {
    emit(state.copyWith(status: OrProStatus.loading));

    if (state.rowList.isEmpty) {
      emit(state.copyWith(status: OrProStatus.error, msg: "Order is empty!"));
      return;
    }
    var items = state.rowList
        .map(
          (e) => OrderProdWrite(
            customPrice: e.customPrice,
            customQuantity: e.customQuantity,
            warehouseProductId: e.slctdWp!.id,
          ),
        )
        .toList();
    var body = OrderProdBulkWrite(orderId: orderId, items: items);
    var res = await _repo.createOrderProds(body: body);

    if (res is DataSuccess) {
      emit(state.copyWith(status: OrProStatus.success));
      emptyState();
    } else {
      emit(state.copyWith(status: OrProStatus.error, msg: res.errorMsg));
    }
  }
}
