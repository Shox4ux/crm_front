import 'package:crm_app/app/new/home/presentation/bloc/cubit/drawerx_cubit.dart';
import 'package:crm_app/app/new/home/presentation/widget/drawerx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeXScreen extends StatelessWidget {
  const HomeXScreen({super.key});

  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
        drawer: const D(),
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
          title: const Text("Home Screen"),
        ),
        body: Row(
          children: [
            Expanded(
              child: BlocBuilder<DrawerXCubit, DrawerXState>(
                builder: (context, state) {
                  return IndexedStack(
                    index: state.selectedIndex,
                    children: const [
                      Center(child: Text("Dashboard Screen")),
                      Center(child: Text("Orders Screen")),
                      Center(child: Text("Products Screen")),
                      Center(child: Text("Clients Screen")),
                      Center(child: Text("Settings Screen")),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
