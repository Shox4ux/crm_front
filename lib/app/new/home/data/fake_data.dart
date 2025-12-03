import 'package:crm_app/app/new/common/ui/app_assets.dart';
import 'package:crm_app/app/new/common/ui/app_colour.dart';
import 'package:flutter/material.dart';

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

class DashItem {
  String primary;
  int index;
  String secondary;
  String icon;
  Color iconColor;
  bool isMoney;
  bool isIncreased;
  DashItem({
    required this.primary,
    required this.index,
    required this.secondary,
    required this.icon,
    required this.iconColor,
    required this.isMoney,
    required this.isIncreased,
  });
}

List<DashItem> dashItems = [
  DashItem(
    primary: "Total Clients",
    index: 20034,
    secondary: "5% increase",
    icon: AppAssets.clients,
    isMoney: false,
    isIncreased: true,
    iconColor: AppColour.dashClient,
  ),
  DashItem(
    primary: "Total Orders",
    index: 15000,
    secondary: "3% decrease",
    icon: AppAssets.products,
    isMoney: false,
    isIncreased: false,
    iconColor: AppColour.dashOrder,
  ),
  DashItem(
    primary: "Total Revenue",
    index: 500000,
    secondary: "10% decrease",
    icon: AppAssets.chart,
    isMoney: true,
    isIncreased: false,
    iconColor: AppColour.dashChart,
  ),
  DashItem(
    primary: "Pending Orders",
    index: 3000,
    secondary: "2% increase",
    icon: AppAssets.returnIcon,
    isMoney: false,
    iconColor: AppColour.dashPending,
    isIncreased: true,
  ),
];
