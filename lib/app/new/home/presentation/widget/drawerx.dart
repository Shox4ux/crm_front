import 'package:crm_app/app/new/home/presentation/bloc/cubit/drawerx_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class D extends StatelessWidget {
  const D({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            // ------------------------------
            // HEADER
            // ------------------------------
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(radius: 30),
                  SizedBox(height: 12),
                  Text(
                    "John Doe",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "john@example.com",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ------------------------------
            // BODY (MENU ITEMS)
            // Fills remaining space
            // ------------------------------
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.dashboard),
                    title: const Text("Dashboard"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Profile"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings"),
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // ------------------------------
            // SEPARATOR LINE (SPACE + DIVIDER)
            // ------------------------------
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(thickness: 1),
            ),

            // ------------------------------
            // FOOTER
            // ------------------------------
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(Icons.logout, color: Colors.red),
                  const SizedBox(width: 12),
                  const Text(
                    "Logout",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerX extends StatelessWidget {
  const DrawerX({super.key});

  final drawerItems = const [
    "Dashboard",
    "Orders",
    "Products",
    "Clients",
    "Settings",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerXCubit, DrawerXState>(
      builder: (context, state) {
        return Container(
          width: 240,
          color: Colors.grey.shade900,
          child: ListView.builder(
            itemCount: drawerItems.length,
            itemBuilder: (context, index) {
              final bool isSelected = index == state.selectedIndex;

              return InkWell(
                onTap: () {
                  context.read<DrawerXCubit>().changeIndex(index);
                  Scaffold.of(context).closeDrawer();
                  // Navigator.pop(context); // close drawer if using Modal drawer
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 18,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.blue.withValues(alpha: 0.15)
                        : Colors.transparent,
                    border: isSelected
                        ? Border(left: BorderSide(color: Colors.blue, width: 4))
                        : null,
                  ),
                  child: Text(
                    drawerItems[index],
                    style: TextStyle(
                      fontSize: 16,
                      color: isSelected ? Colors.white : Colors.grey.shade400,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
