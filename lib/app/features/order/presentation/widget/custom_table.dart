import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/features/order/data/fake_data.dart';
import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  final List<String> clms;
  final List<OrderData> rows;

  const CustomTable({super.key, required this.clms, required this.rows});

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
    return List.generate(rows.length, (rowIndex) {
      return Column(
        children: [
          Row(
            children: [
              RowCellText(txt: rows[rowIndex].clientName),
              RowCellText(txt: rows[rowIndex].clientAddress),
              RowCellText(txt: rows[rowIndex].date),
              RowCellText(txt: rows[rowIndex].type),
              RowCellText(status: rows[rowIndex].status),
            ],
          ),

          // Divider between data rows
          if (rowIndex != rows.length - 1)
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
        style: AppTextStyle.medium.copyWith(color: AppColour.white),
      ),
    );
  }
}

class RowCellText extends StatelessWidget {
  const RowCellText({super.key, this.txt = "", this.status});
  final String txt;
  final OrderStatus? status;

  @override
  Widget build(BuildContext context) {
    return status != null
        ? Flexible(
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
                  style: AppTextStyle.medium.copyWith(color: AppColour.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        : Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                txt,
                style: AppTextStyle.medium,
                textAlign: TextAlign.center,
              ),
            ),
          );
  }
}
