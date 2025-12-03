import 'package:crm_app/app/new/common/ui/app_assets.dart';
import 'package:crm_app/app/new/common/ui/app_colour.dart';
import 'package:crm_app/app/new/common/ui/app_text_style.dart';
import 'package:crm_app/app/new/home/data/fake_data.dart';
import 'package:crm_app/app/new/home/presentation/widget/bordered_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({super.key, required this.item});
  final DashItem item;

  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  spacing: 30,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.primary,
                      style: AppTextStyle.small.copyWith(
                        color: AppColour.textSecondaryDark,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      item.isMoney ? "\$ ${item.index}" : item.index.toString(),
                      style: AppTextStyle.large.copyWith(
                        color: AppColour.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                width: 70,
                padding: const EdgeInsets.all(14),
                child: SvgPicture.asset(
                  item.icon,
                  colorFilter: ColorFilter.mode(
                    AppColour.white,
                    BlendMode.srcIn,
                  ),
                ),
                decoration: BoxDecoration(
                  color: item.iconColor,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ],
          ),
          Row(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(
                item.isIncreased ? AppAssets.increase : AppAssets.decrease,
              ),
              Text(
                item.secondary,
                style: AppTextStyle.medium.copyWith(
                  color: item.isIncreased ? AppColour.green : AppColour.red,
                ),
              ),
              Text(
                "for this month",
                style: AppTextStyle.medium.copyWith(
                  color: AppColour.white,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
