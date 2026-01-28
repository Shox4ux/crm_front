import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/features/order/domain/entity/order_entity.dart';
import 'package:crm_app/app/features/order/presentation/utils/date_formatter.dart';
import 'package:crm_app/app/features/order/presentation/utils/get_total.dart';
import 'package:crm_app/app/features/order/presentation/utils/order_enum_status.dart';
import 'package:crm_app/app/features/order/presentation/utils/order_list_view_enum.dart';
import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  final List<String> clms;
  final List<OrderEntity> rows;
  final void Function(OrderEntity order) delAction;
  final void Function(OrderEntity order) editAction;

  const CustomTable({
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
  List<Widget> _buildRows() {
    return List.generate(rows.length, (i) {
      return Column(
        children: [
          Row(
            children: [
              RowCellText(txt: "${i + 1}"),
              RowCellText(txt: rows[i].client?.user.username ?? ""),
              RowCellText(txt: rows[i].client?.user.address ?? ""),
              RowCellText(txt: formatDateTime(rows[i].createdAt)),
              RowCellText(
                txt: "\$ ${getTotal(rows[i].orderProducts).toStringAsFixed(2)}",
              ),
              RowCellText(txt: "\$ ${rows[i].paidAmount.toString()}"),
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
    }
  }
}
