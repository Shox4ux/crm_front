import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  final List<String> columns;
  final List<List<String>> rows;

  const CustomTable({super.key, required this.columns, required this.rows});

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
        children: List.generate(columns.length, (index) {
          return Expanded(
            child: Text(
              columns[index],
              style: AppTxtStl.medium.copyWith(color: AppColour.white),
            ),
          );
        }),
      ),
    );
  }

  // ---------------- DATA ROWS ----------------
  List<Widget> _buildRows() {
    return List.generate(rows.length, (rowIndex) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(rows[rowIndex].length, (colIndex) {
              return Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    rows[rowIndex][colIndex],
                    style: AppTxtStl.medium.copyWith(color: AppColour.white),
                  ),
                ),
              );
            }),
          ),

          // Divider between data rows
          if (rowIndex != rows.length - 1)
            Container(height: 1, color: AppColour.whiteStroke),
        ],
      );
    });
  }
}
