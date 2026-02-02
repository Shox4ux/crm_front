import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/features/order/presentation/utils/order_enum_status.dart';
import 'package:crm_app/app/features/order/presentation/utils/order_list_view_enum.dart';
import 'package:crm_app/app/features/warehouse_prod/domain/entity/ware_pro_entitiy.dart';
import 'package:flutter/material.dart';

class WareProInfoTable extends StatelessWidget {
  final List<String> clms;
  final List<WareProEntity> rows;
  final void Function(WareProEntity order) delAction;
  final void Function(WareProEntity order) editAction;

  const WareProInfoTable({
    super.key,
    required this.clms,
    required this.rows,
    required this.delAction,
    required this.editAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColour.stroke),
        borderRadius: AppRadius.cardRadius,
      ),
      child: Column(children: [_buildHeader(), ..._buildRows()]),
    );
  }

  // ---------------- HEADER ----------------
  Widget _buildHeader() {
    return BorderedContainer(
      color: AppColour.textFieldBgDark,
      borderRadius: BorderRadius.only(
        topLeft: AppRadius.customRadius,
        topRight: AppRadius.customRadius,
      ),
      borderColor: AppColour.whiteStroke,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: List.generate(clms.length, (i) => ClnCellText(txt: clms[i])),
      ),
    );
  }

  // ---------------- DATA ROWS ----------------

  //  final colist = [
  //   "number",
  //   "product name",
  //   "warehouse",
  //   "actual qty",
  //   "warehouse qty",
  //   "price",
  //   "status",
  //   "actions",
  // ];
  List<Widget> _buildRows() {
    return List.generate(rows.length, (i) {
      return Column(
        children: [
          Row(
            children: [
              RowCellText(txt: "${i + 1}"),
              RowCellText(txt: rows[i].product?.name ?? ""),
              RowCellText(txt: rows[i].warehouseId.toString()),
              RowCellText(txt: rows[i].product?.totalQuantity.toString() ?? ""),
              RowCellText(txt: rows[i].quantity.toString()),
              RowCellText(
                txt: "\$ ${rows[i].product?.sellPrice.toStringAsFixed(2)}",
              ),
              RowCellText(
                status: orderStatusFromInt(rows[i].status),
                viewEnum: OrderListViewEnum.status,
              ),
              RowCellText(
                viewEnum: OrderListViewEnum.action,
                delAction: () => delAction(rows[i]),
                editAction: () => editAction(rows[i]),
              ),
            ],
          ),

          // Divider between data rows
          if (i != rows.length - 1)
            Container(height: 1, color: AppColour.whiteStroke),
        ],
      );
    });
  }
}

class ClnCellText extends StatelessWidget {
  const ClnCellText({super.key, this.txt = ""});
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        txt.toUpperCase(),
        textAlign: TextAlign.center,
        style: AppTxtStl.medium.copyWith(color: AppColour.white),
      ),
    );
  }
}

class RowCellText extends StatelessWidget {
  const RowCellText({
    super.key,
    this.txt = "",
    this.status,
    this.viewEnum = OrderListViewEnum.text,
    this.delAction,
    this.editAction,
  });
  final String txt;
  final OrderEnumStatus? status;
  final OrderListViewEnum viewEnum;
  final void Function()? delAction;
  final void Function()? editAction;

  @override
  Widget build(BuildContext context) {
    switch (viewEnum) {
      case OrderListViewEnum.action:
        return Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              IconButton(
                onPressed: editAction,
                icon: Icon(Icons.edit, color: Colors.blue),
              ),
              IconButton(
                onPressed: delAction,
                icon: Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        );
      case OrderListViewEnum.status:
        return Flexible(
          child: Center(
            child: Container(
              alignment: Alignment.center,
              width: 140,
              decoration: BoxDecoration(
                color: status?.color,
                borderRadius: AppRadius.buttonRadius,
              ),
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              child: Text(
                status?.name.toUpperCase() ?? "",
                style: AppTxtStl.medium.copyWith(color: AppColour.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      case OrderListViewEnum.text:
        return Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              txt,
              style: AppTxtStl.medium,
              textAlign: TextAlign.center,
            ),
          ),
        );
      case OrderListViewEnum.debt:
        return Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              txt,
              style: AppTxtStl.medium.copyWith(color: AppColour.rejectedDark),
              textAlign: TextAlign.center,
            ),
          ),
        );
    }
  }
}
