import 'package:crm_app/app/src/logic/drawer_cubit/drawer_cubit.dart';
import 'package:crm_app/app/utils/widgets/drawer/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MianScreen extends StatelessWidget {
  const MianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.watch<DrawerCubit>().getData()?.title ?? "Home"),
      ),
      drawer: AppDrawer(),
      body: BlocBuilder<DrawerCubit, DrawerState>(
        builder: (context, state) {
          if (state is DrawerInitial) {
            return state.initData.screen;
          } else if (state is DrawerItemPressed) {
            return state.data.screen;
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
