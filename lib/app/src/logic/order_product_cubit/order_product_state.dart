// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_product_cubit.dart';

enum OrProStatus {
  init,
  loading,
  success,
  error,
  loadingW,
  loadingWp,
  onAdd,
  onEdit,
  onReady,
}

class OrderProductState {
  final OrProStatus status;
  final List<WarehouseRead>? wList;
  final List<WarehouseProductRead>? wpList;
  final List<ClientRead>? cList;
  final List<OrderRowData> rowList;
  final ClientRead? slctClient;
  final String? msg;
  final int curRowIndex;
  OrderProductState({
    this.slctClient,
    required this.status,
    this.wList,
    this.wpList,
    this.cList,
    required this.rowList,
    this.msg,
    this.curRowIndex = 0,
  });

  OrderProductState copyWith({
    OrProStatus? status,
    List<WarehouseRead>? wList,
    List<WarehouseProductRead>? wpList,
    List<ClientRead>? cList,
    List<OrderRowData>? rList,
    ClientRead? slctClient,
    String? msg,
    int? curRowIndex,
  }) {
    return OrderProductState(
      status: status ?? this.status,
      wList: wList ?? this.wList,
      wpList: wpList ?? this.wpList,
      cList: cList ?? this.cList,
      rowList: rList ?? this.rowList,
      slctClient: slctClient ?? this.slctClient,
      msg: msg ?? this.msg,
      curRowIndex: curRowIndex ?? this.curRowIndex,
    );
  }
}
