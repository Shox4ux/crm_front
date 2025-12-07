// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:crm_app/app/features/common/widget/custon_no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:crm_app/app/src/data/remote/models/response/warehouse/warehouse_product_read.dart';
import 'package:crm_app/app/src/data/remote/models/response/warehouse/warehouse_read.dart';
import 'package:crm_app/app/src/logic/logic.dart';
import 'package:crm_app/app/utils/widgets/custom_drop_menu.dart';
import 'package:crm_app/app/utils/widgets/custom_field.dart';

class OrderRowData {
  final int? id;
  final num customPrice;
  final num customQuantity;
  WarehouseProductRead? slctdWp;
  WarehouseRead? slctWare;
  List<WarehouseProductRead>? wpList;
  List<WarehouseRead>? wList;
  OrderRowData({
    this.id,
    required this.customPrice,
    required this.customQuantity,
    this.slctdWp,
    this.slctWare,
    this.wpList,
    this.wList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customPrice': customPrice,
      'customQuantity': customQuantity,
      'slctdWp': slctdWp?.toMap(),
      'slctWare': slctWare?.toMap(),
      'wpList': wpList?.map((x) => x.toMap()).toList(),
      'wList': wList?.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderRowData.fromMap(Map<String, dynamic> map) {
    return OrderRowData(
      customPrice: map['customPrice'] as num,
      customQuantity: map['customQuantity'] as num,
      slctdWp: map['slctdWp'] != null
          ? WarehouseProductRead.fromMap(map['slctdWp'] as Map<String, dynamic>)
          : null,
      slctWare: map['slctWare'] != null
          ? WarehouseRead.fromMap(map['slctWare'] as Map<String, dynamic>)
          : null,
      wpList: map['wpList'] != null
          ? List<WarehouseProductRead>.from(
              (map['wpList'] as List<int>).map<WarehouseProductRead?>(
                (x) => WarehouseProductRead.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      wList: map['wList'] != null
          ? List<WarehouseRead>.from(
              (map['wList'] as List<int>).map<WarehouseRead?>(
                (x) => WarehouseRead.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderRowData.fromJson(String source) =>
      OrderRowData.fromMap(json.decode(source) as Map<String, dynamic>);

  OrderRowData copyWith({
    int? id,
    num? customPrice,
    num? customQuantity,
    WarehouseProductRead? slctdWp,
    WarehouseRead? slctWare,
    List<WarehouseProductRead>? wpList,
    List<WarehouseRead>? wList,
  }) {
    return OrderRowData(
      id: id ?? this.id,
      customPrice: customPrice ?? this.customPrice,
      customQuantity: customQuantity ?? this.customQuantity,
      slctdWp: slctdWp ?? this.slctdWp,
      slctWare: slctWare ?? this.slctWare,
      wpList: wpList ?? this.wpList,
      wList: wList ?? this.wList,
    );
  }
}

// ---------------------------------------------------------------------->

List<String> colList = [
  "Warehouse",
  "Product",
  "Sell Price",
  "Sold Price",
  "Quantity",
  "Sell Quantity",
  "Total",
  "Action",
];

class OrderRowTable extends StatefulWidget {
  const OrderRowTable({super.key});
  @override
  State<OrderRowTable> createState() => _OrderRowTableState();
}

class _OrderRowTableState extends State<OrderRowTable> {
  late List<TextEditingController> _cpCtrls;
  late OrderProdCubit _opCubit;
  late List<TextEditingController> _cqCtrls;

  @override
  void initState() {
    super.initState();

    _opCubit = context.read<OrderProdCubit>();
    _cpCtrls = [];
    _cqCtrls = [];
  }

  void _onAdd() {
    _cpCtrls.add(TextEditingController());
    _cqCtrls.add(TextEditingController());
  }

  @override
  void dispose() {
    _cpCtrls.forEach((v) => v.dispose());
    _cqCtrls.forEach((v) => v.dispose());
    _opCubit.close();
    super.dispose();
  }

  void _onPrice(String? val, int i) {
    _opCubit.updateRowP(i: i, pVal: num.tryParse(val!));
  }

  void _onQuantity(String? val, int i) {
    _opCubit.updateRowQ(i: i, qVal: num.tryParse(val ?? ""));
  }

  void _onRemove(int i, {OrderRowData? row}) {
    _opCubit.removeRow(i: i, row: row).then((v) {
      _cpCtrls.removeAt(i);
      _cqCtrls.removeAt(i);
    });
  }

  void _onSlctWare(int i, WarehouseRead w) {
    setState(() {
      _opCubit.onSlctWare(i, w);
    });
  }

  void _onSlctWP(int i, WarehouseProductRead wp) {
    setState(() {
      _opCubit.onSlctWP(i, wp);
    });
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      child: BlocConsumer<OrderProdCubit, OrderProductState>(
        listener: (context, state) {
          if (state.status == OrProStatus.onAdd) {
            _onAdd();
          }
        },
        builder: (c, state) {
          var list = state.rowList;
          if (list.isEmpty) {
            return NoData();
          }

          if (_cpCtrls.isEmpty && _cqCtrls.isEmpty && list.isNotEmpty) {
            for (var i in _opCubit.state.rowList) {
              _cpCtrls.add(
                TextEditingController(text: i.customPrice.toString()),
              );
              _cqCtrls.add(
                TextEditingController(text: i.customQuantity.toString()),
              );
            }
          }

          return DataTable(
            columns: List.generate(colList.length, (i) => _columns(colList[i])),
            rows: List.generate(
              list.length,
              (i) => _proCells(
                i,
                list[i],
                () => _onRemove(i, row: list[i]),
                (price) => _onPrice(price, i),
                (quantity) => _onQuantity(quantity, i),
                (w) => _onSlctWare(i, w!),
                (wp) => _onSlctWP(i, wp!),
              ),
            ),
          );
        },
      ),
    );
  }

  DataColumn _columns(String title) {
    return DataColumn(
      label: Expanded(
        child: Text(title, style: TextStyle(fontStyle: FontStyle.italic)),
      ),
    );
  }

  DataRow _proCells(
    int i,
    OrderRowData row,
    void Function() onDel,
    void Function(String? val) onPrice,
    void Function(String? val) onQuantity,
    void Function(WarehouseRead?)? wFun,
    void Function(WarehouseProductRead?)? wpFun,
  ) {
    return DataRow(
      cells: [
        DataCell(WDrop(action: wFun, list: row.wList, sVal: row.slctWare)),
        DataCell(WPDrop(action: wpFun, list: row.wpList, sVal: row.slctdWp)),
        DataCell(Text("${row.slctdWp?.product!.sellPrice ?? 0.0} \$")),
        DataCell(
          CustomField(ctrl: _cpCtrls[i], action: onPrice, isMoney: true),
        ),
        DataCell(Text(row.slctdWp?.quantity.toString() ?? "0")),
        DataCell(CustomField(ctrl: _cqCtrls[i], action: onQuantity)),
        DataCell(Text("${context.read<OrderProdCubit>().sumUp(i)} \$")),
        DataCell(IconButton(icon: Icon(Icons.delete), onPressed: onDel)),
      ],
    );
  }
}
