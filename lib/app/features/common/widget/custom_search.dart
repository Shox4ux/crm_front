import 'package:crm_app/app/features/common/ui/app_assets.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/home/presentation/widget/bordered_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key, this.onChanged});
  final void Function(String val)? onChanged;
  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
      borderRadius: AppRadius.buttonRadius,
      height: 38,
      width: 250,
      child: TextField(
        cursorColor: AppColour.textFieldBgLight,
        onChanged: onChanged,
        decoration: InputDecoration(
          hint: Row(
            spacing: 10,
            children: [
              SvgPicture.asset(AppAssets.search),
              Text("Search by name"),
            ],
          ),

          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
