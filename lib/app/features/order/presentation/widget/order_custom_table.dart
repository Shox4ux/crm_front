import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/widget/custom_text.dart';
import 'package:crm_app/app/features/common/widget/table_colmn_cell.dart';
import 'package:crm_app/app/features/common/widget/table_row_cell.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/features/order/domain/entity/order_entity.dart';
import 'package:crm_app/app/features/order/presentation/utils/date_formatter.dart';
import 'package:crm_app/app/features/order/presentation/utils/get_total.dart';
import 'package:crm_app/app/features/order/presentation/utils/order_enum_status.dart';
import 'package:crm_app/app/features/order/presentation/utils/order_list_view_enum.dart';
import 'package:flutter/material.dart';

class OrderCustomTable extends StatelessWidget {
  final List<String> clms;
  final List<OrderEntity> rows;
  final void Function(OrderEntity order) delAction;
  final void Function(OrderEntity order) editAction;

  const OrderCustomTable({
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
        children: List.generate(clms.length, (i) => ClmCell(txt: clms[i])),
      ),
    );
  }

  // ---------------- DATA ROWS ----------------
  List<Widget> _buildRows() {
    return List.generate(rows.length, (i) {
      return Column(
        children: [
          i == 1 ? _getRow(i, rows[i]) : _getExpdRow(i, rows[i]),
          if (i != rows.length - 1)
            Container(height: 1, color: AppColour.whiteStroke),
        ],
      );
    });
  }

  Widget _getExpdRow(int i, OrderEntity data) {
    return ExpansionTile(
      title: _getRow(i, data),
      textColor: AppColour.textSecondaryDark,
      collapsedTextColor: AppColour.textSecondaryDark,
      trailing: null,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent, width: 1),
      ),
      showTrailingIcon: false,
      minTileHeight: 0,
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.all(10),
      expandedAlignment: Alignment.centerLeft,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(primary: "Reason: ", secondary: "secondary"),
            Row(
              spacing: 32,
              children: [
                CustomText(primary: "Updater: ", secondary: "secondary"),
                CustomText(primary: "Updated At: ", secondary: "secondary"),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _getRow(int i, OrderEntity data) {
    return Row(
      children: [
        RowCell(txt: "${i + 1}"),
        RowCell(txt: data.client?.user.username ?? ""),
        RowCell(txt: data.client?.user.address ?? ""),
        RowCell(txt: formatDateTime(data.createdAt)),
        RowCell(txt: formatDate(data.deliveryOn!)),
        RowCell(txt: "\$ ${getTotal(data.orderProducts).toStringAsFixed(2)}"),
        RowCell(txt: "\$ ${data.paidAmount.toString()}"),
        RowCell(
          txt:
              "\$ ${(getTotal(data.orderProducts) - data.paidAmount).toStringAsFixed(2)}",
        ),
        RowCell(
          status: orderStatusFromInt(data.status),
          viewEnum: OrderListViewEnum.status,
        ),
        RowCell(
          viewEnum: OrderListViewEnum.action,
          delAction: () => delAction(data),
          editAction: () => editAction(data),
        ),
      ],
    );
  }
}
