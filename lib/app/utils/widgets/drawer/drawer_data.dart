// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crm_app/app/src/screens.dart';
import 'package:crm_app/app/src/screens/product/product_screen.dart';
import 'package:crm_app/app/src/screens/orders/order_list_screen.dart';
import 'package:crm_app/app/src/screens/warehouse/warehouse_screen.dart';
import 'package:flutter/widgets.dart';

class DrawerData {
  final String title;
  final Widget screen;
  DrawerData({required this.title, required this.screen});
}

List<DrawerData> drawerList = [
  DrawerData(title: "Home", screen: const HomeScreen()),
  DrawerData(title: "Warehouse", screen: const WarehouseScreen()),
  // DrawerData(title: "Clients", screen: const ClientListScreen()),
  DrawerData(title: "Orders", screen: const OrderListScreen()),
  DrawerData(title: "Products", screen: const ProductScreen()),
];
