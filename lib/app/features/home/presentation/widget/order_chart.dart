import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OrderChart extends StatelessWidget {
  const OrderChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      width: double.infinity,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 9,
          minY: 0,
          maxY: 100,

          // GRID
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            drawVerticalLine: false,
            horizontalInterval: 20,
            getDrawingHorizontalLine: (value) {
              return FlLine(color: AppColour.stroke, strokeWidth: 1);
            },
          ),

          // BORDER
          borderData: FlBorderData(show: false),

          // X AXIS
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: TextStyle(fontSize: 12),
                  );
                },
              ),
            ),

            // 🔥 Shadow under the line

            // Y AXIS
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Text(
                    "${value.toInt()}\%",
                    style: TextStyle(fontSize: 12),
                  );
                },
              ),
            ),

            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),

          lineTouchData: LineTouchData(
            getTouchLineEnd: (barData, spotIndex) => 0,
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (touchedSpot) => AppColour.secondaryDark,
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((spot) {
                  return LineTooltipItem(
                    '${spot.y.toInt()}%',
                    TextStyle(color: Colors.white),
                  );
                }).toList();
              },
            ),
          ),
          // DATA POINTS
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              color: AppColour.secondaryDark,
              barWidth: 1,
              dotData: FlDotData(show: true),

              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColour.secondaryDark.withValues(alpha: 0.4),
                    AppColour.secondaryDark.withValues(alpha: 0.0),
                  ],
                ),
              ),

              spots: [
                FlSpot(0, 10),
                FlSpot(1.5, 40),
                FlSpot(3, 25),
                FlSpot(5, 60),
                FlSpot(7, 50),
                FlSpot(9, 85),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
