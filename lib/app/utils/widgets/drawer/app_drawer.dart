import 'package:crm_app/app/src/logic/drawer_cubit/drawer_cubit.dart';
import 'package:crm_app/app/utils/widgets/drawer/drawer_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: drawerList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.read<DrawerCubit>().setIndex(index);
              context.read<DrawerCubit>().onDrawerItemPressed(
                data: drawerList[index],
              );
            },
            child: _drawerItem(
              (index == context.watch<DrawerCubit>().getIndex()),
              drawerList[index],
            ),
          );
        },
      ),
    );
  }

  Widget _drawerItem(bool isSelected, DrawerData drawerItem) {
    return Container(
      margin: EdgeInsets.only(left: 5, bottom: 5),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.white,
      ),
      child: Center(
        child: Text(
          drawerItem.title,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
