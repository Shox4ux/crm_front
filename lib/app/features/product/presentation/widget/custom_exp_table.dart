import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:crm_app/app/utils/widgets/custom_ibtn.dart';
import 'package:flutter/material.dart';

class CustomExpTable extends StatelessWidget {
  final List<String> columns;
  final List<Map<String, dynamic>> rows;
  final void Function(int i) onRemoveExp;

  const CustomExpTable({
    super.key,
    required this.columns,
    required this.rows,
    required this.onRemoveExp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(spacing: 15, children: [_buildHeader(), ..._buildRows()]);
  }

  // ---------------- HEADER ----------------
  Widget _buildHeader() {
    return BorderedContainer(
      color: AppColour.textFieldBgDark,
      borderRadius: AppRadius.buttonRadius,
      borderColor: AppColour.whiteStroke,
      padding: const EdgeInsets.all(16),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(columns.length, (index) {
          return Text(
            columns[index],
            style: AppTxtStl.medium.copyWith(
              color: AppColour.white,
              fontSize: 18,
            ),
          );
        }),
      ),
    );
  }

  // ---------------- DATA ROWS ----------------
  List<Widget> _buildRows() {
    return List.generate(rows.length, (i) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              key: ValueKey("exp_row_${rows[i]['name']}_${rows[i]['amount']}"),
              children: [
                Expanded(child: Text(i.toString())),

                Expanded(child: Text(rows[i]['name'], style: AppTxtStl.medium)),
                Expanded(
                  child: Text(
                    "\$ ${rows[i]["amount"]}",
                    style: AppTxtStl.medium,
                  ),
                ),
                Row(
                  children: [
                    CustomIbtn(onPress: () => onRemoveExp(i)),
                    CustomIbtn(onPress: () {}, isEdit: true),
                  ],
                ),
              ],
            ),

            if (i != rows.length - 1)
              Container(height: 1, color: AppColour.whiteStroke),
          ],
        ),
      );
    });
  }
}
