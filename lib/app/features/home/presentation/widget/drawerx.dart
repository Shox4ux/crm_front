import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/ui/app_radius.dart';
import 'package:crm_app/app/features/common/ui/app_text_style.dart';
import 'package:crm_app/app/features/core/router/route_names.dart';
import 'package:crm_app/app/features/home/presentation/bloc/cubit/drawerx_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

const List<String> items = [
  "Home",
  "Products",
  "Warehouse",
  "Clients",
  "Orders",
];

class DrawerX extends StatelessWidget {
  const DrawerX({super.key});

  bool isSelected(BuildContext context, int index) {
    final state = context.watch<DrawerXCubit>().state;
    return state.selectedIndex == index;
  }

  void onTap(BuildContext context, int index) {
    context.read<DrawerXCubit>().changeIndex(index);
    context.read<DrawerXCubit>().toggleDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "App Drawer",
              textAlign: TextAlign.center,
              style: AppTextStyle.large.copyWith(fontSize: 24),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return DrawerItem(
                  selected: isSelected(context, index),
                  title: items[index],
                  onTap: () => onTap(context, index),
                );
              },
            ),
          ),
          Divider(height: 0.5, color: AppColour.stroke),
          Column(
            children: [
              DrawerFooterItem(
                title: 'Logout',
                onTap: () => context.go(Routes.login),
              ),
              DrawerFooterItem(title: 'Settings'),
            ],
          ),
        ],
      ),
    );
  }
}

class DrawerFooterItem extends StatelessWidget {
  const DrawerFooterItem({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, textAlign: TextAlign.center),
      onTap: onTap,
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const DrawerItem({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: 4,
          height: 48,
          decoration: BoxDecoration(
            color: selected ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            onTap: onTap,
            title: Container(
              decoration: BoxDecoration(
                borderRadius: AppRadius.drawerRadius,
                color: selected ? AppColour.secondaryDark : Colors.transparent,
              ),
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                textAlign: TextAlign.center,
                title,
                style: AppTextStyle.medium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
