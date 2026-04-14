import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/common/widget/table_colmn_cell.dart';
import 'package:crm_app/app/features/common/widget/table_row_cell.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/features/order/data/model/order_response.dart';
import 'package:crm_app/app/features/order/presentation/utils/date_formatter.dart';
import 'package:crm_app/app/features/order/presentation/utils/get_total.dart';
import 'package:crm_app/app/features/order/presentation/utils/order_enum_status.dart';
import 'package:crm_app/app/features/order/presentation/utils/order_list_view_enum.dart';
import 'package:flutter/material.dart';

class ClientOrderTable extends StatelessWidget {
  final List<String> clms;
  final List<OrderResponse> rows;

  final void Function(OrderResponse order)? delAction;
  final void Function(OrderResponse order)? editAction;

  const ClientOrderTable({
    super.key,
    required this.clms,
    required this.rows,
    this.delAction,
    this.editAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(spacing: 15, children: [_buildHeader(), ..._buildRows()]);
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
          Row(
            children: [
              RowCell(txt: "${i + 1}"),
              RowCell(txt: formatDateTime(rows[i].createdAt)),
              RowCell(
                txt: "\$ ${getTotal(rows[i].orderProducts).toStringAsFixed(2)}",
              ),
              RowCell(txt: "\$ ${rows[i].paidAmount.toString()}"),
              RowCell(
                txt:
                    "\$ ${(getTotal(rows[i].orderProducts) - rows[i].paidAmount).toStringAsFixed(2)}",
              ),

              RowCell(
                status: orderStatusFromInt(rows[i].status),
                viewEnum: OrderListViewEnum.status,
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
