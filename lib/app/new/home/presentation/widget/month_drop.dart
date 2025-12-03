import 'package:crm_app/app/new/common/ui/app_assets.dart';
import 'package:crm_app/app/new/common/ui/app_colour.dart';
import 'package:crm_app/app/new/common/ui/app_radius.dart';
import 'package:crm_app/app/new/common/ui/app_text_style.dart';
import 'package:crm_app/app/new/home/presentation/widget/bordered_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<Map<String, int>> months = [
  {"January": 1},
  {"February": 2},
  {"March": 3},
  {"April": 4},
  {"May": 5},
  {"June": 6},
  {"July": 7},
  {"August": 8},
  {"September": 9},
  {"October": 10},
  {"November": 11},
  {"December": 12},
];

class MonthDrop extends StatelessWidget {
  const MonthDrop({super.key});

  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
      borderRadius: AppRadius.buttonRadius,
      color: AppColour.textFieldBgDark,
      borderColor: AppColour.whiteStroke,
      padding: EdgeInsets.all(10),
      child: DropdownButton<Map<String, int>>(
        value: months.first,
        isDense: true,

        icon: SizedBox(
          height: 12,
          width: 12,
          child: SvgPicture.asset(AppAssets.arrowDown),
        ),
        underline: SizedBox.shrink(),

        items: months.map((month) {
          return DropdownMenuItem<Map<String, int>>(
            value: month,
            child: Text(month.keys.first, style: AppTextStyle.medium),
          );
        }).toList(),
        onChanged: (value) {},
      ),
    );
  }
}
