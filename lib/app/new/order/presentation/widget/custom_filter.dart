import 'package:crm_app/app/new/common/ui/app_assets.dart';
import 'package:crm_app/app/new/common/ui/app_colour.dart';
import 'package:crm_app/app/new/common/ui/app_radius.dart';
import 'package:crm_app/app/new/common/ui/app_text_style.dart';
import 'package:crm_app/app/new/home/presentation/widget/bordered_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFilter extends StatelessWidget {
  const CustomFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
      borderRadius: AppRadius.filterRadius,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FilterItem(img: SvgPicture.asset(AppAssets.filter)),
          FilterItem(txt: "from date"),
          FilterItem(txt: "to date"),
          FilterItem(txt: "order status"),
          FilterItem(
            img: InkWell(
              onTap: () => print("object"),
              child: Row(
                spacing: 5,
                children: [
                  SvgPicture.asset(AppAssets.returnIcon, height: 20, width: 20),
                  Text(
                    "Reset filter",
                    style: AppTextStyle.medium.copyWith(
                      color: AppColour.dashPending,
                    ),
                  ),
                ],
              ),
            ),
            isEnd: true,
          ),
        ],
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  const FilterItem({super.key, this.txt, this.isEnd = false, this.img});
  final String? txt;
  final bool isEnd;
  final Widget? img;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: BoxDecoration(
        border: Border(
          right: !isEnd ? BorderSide(color: AppColour.stroke) : BorderSide.none,
        ),
      ),
      child:
          img ??
          Text(
            txt ?? "",
            style: AppTextStyle.medium.copyWith(color: AppColour.white),
          ),
    );
  }
}
