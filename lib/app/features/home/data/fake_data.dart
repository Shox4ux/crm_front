// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:crm_app/app/features/common/ui/app_assets.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';

enum DashType { client, order, revenue, unpaid }

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
  num index;
  String secondary;
  String icon;
  Color iconColor;
  bool isMoney;
  bool isIncreased;
  DashType type;
  DashItem({
    required this.primary,
    required this.index,
    required this.secondary,
    required this.icon,
    required this.iconColor,
    required this.isMoney,
    required this.isIncreased,
    required this.type,
  });

  DashItem copyWith({
    String? primary,
    num? index,
    String? secondary,
    String? icon,
    Color? iconColor,
    bool? isMoney,
    bool? isIncreased,
    DashType? type,
  }) {
    return DashItem(
      primary: primary ?? this.primary,
      index: index ?? this.index,
      secondary: secondary ?? this.secondary,
      icon: icon ?? this.icon,
      iconColor: iconColor ?? this.iconColor,
      isMoney: isMoney ?? this.isMoney,
      isIncreased: isIncreased ?? this.isIncreased,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'primary': primary,
      'index': index,
      'secondary': secondary,
      'icon': icon,
      'iconColor': iconColor.value,
      'isMoney': isMoney,
      'isIncreased': isIncreased,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'DashItem(primary: $primary, index: $index, secondary: $secondary, icon: $icon, iconColor: $iconColor, isMoney: $isMoney, isIncreased: $isIncreased, type: $type)';
  }

  @override
  bool operator ==(covariant DashItem other) {
    if (identical(this, other)) return true;

    return other.primary == primary &&
        other.index == index &&
        other.secondary == secondary &&
        other.icon == icon &&
        other.iconColor == iconColor &&
        other.isMoney == isMoney &&
        other.isIncreased == isIncreased &&
        other.type == type;
  }

  @override
  int get hashCode {
    return primary.hashCode ^
        index.hashCode ^
        secondary.hashCode ^
        icon.hashCode ^
        iconColor.hashCode ^
        isMoney.hashCode ^
        isIncreased.hashCode ^
        type.hashCode;
  }
}

List<DashItem> dashItems = [
  DashItem(
    type: DashType.client,
    primary: "Total Clients",
    index: 20034,
    secondary: "5% increase",
    icon: AppAssets.clients,
    isMoney: false,
    isIncreased: true,
    iconColor: AppColour.dashClient,
  ),
  DashItem(
    type: DashType.order,
    primary: "Total Orders",
    index: 15000,
    secondary: "3% decrease",
    icon: AppAssets.products,
    isMoney: false,
    isIncreased: false,
    iconColor: AppColour.dashOrder,
  ),
  DashItem(
    type: DashType.revenue,
    primary: "Total Revenue",
    index: 500000,
    secondary: "10% decrease",
    icon: AppAssets.chart,
    isMoney: true,
    isIncreased: false,
    iconColor: AppColour.dashChart,
  ),
  DashItem(
    type: DashType.unpaid,
    primary: "Unpaid Invoices",
    index: 3000,
    secondary: "2% increase",
    icon: AppAssets.returnIcon,
    isMoney: false,
    iconColor: AppColour.dashPending,
    isIncreased: true,
  ),
];
