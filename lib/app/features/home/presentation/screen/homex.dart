import 'package:crm_app/app/features/client/presentation/screens/client_list.dart';
import 'package:crm_app/app/features/home/presentation/screen/home_holder.dart';
import 'package:crm_app/app/features/order/presentation/screens/order_list.dart';
import 'package:crm_app/app/features/product/presentation/screens/product_list.dart';
import 'package:crm_app/app/features/warehouse/presentation/screens/warehouse_list.dart';
import 'package:crm_app/app/features/warehouse_prod/presentation/screens/ware_pro_info_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm_app/app/features/home/presentation/bloc/cubit/drawerx_cubit.dart';
import 'package:crm_app/app/features/home/presentation/widget/drawerx.dart';

List<Widget> screens = [
  HomeHolder(),
  ProductList(),
  WarehouseList(),
  WareProInfoList(),
  ClientList(),
  OrderList(),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<DrawerXCubit, DrawerXState>(
      listener: (context, state) {
        if (state.isDrawerOpen) {
          _scaffoldKey.currentState?.openDrawer();
        } else {
          _scaffoldKey.currentState?.closeDrawer();
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const DrawerX(),
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  context.read<DrawerXCubit>().toggleDrawer();
                },
              );
            },
          ),
        ),
        body: screens[context.watch<DrawerXCubit>().state.selectedIndex],
      ),
    );
  }
}
