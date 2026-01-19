import 'package:crm_app/app/features/client/presentation/bloc/client_cubit.dart';
import 'package:crm_app/app/features/client/presentation/widget/client_card.dart';
import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:crm_app/app/features/common/widget/custom_progress.dart';
import 'package:crm_app/app/features/common/widget/custom_title.dart';
import 'package:crm_app/app/features/common/widget/custon_no_data.dart';
import 'package:crm_app/app/features/core/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../common/widget/custom_search.dart';

class ClientList extends StatefulWidget {
  const ClientList({super.key});

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        spacing: 30,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTitle(title: "Clients"),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  CustomSearch(
                    onChanged: (val) {
                      setState(() {
                        context.read<ClientCubit>().filter(val);
                      });
                    },
                  ),
                  CustomBtn(
                    onPress: () => context.push("/client_add_edit"),
                    txt: "Add",
                  ),
                ],
              ),
            ],
          ),
          Flexible(
            child: BlocBuilder<ClientCubit, ClientState>(
              builder: (context, state) {
                if (state.status == ClientStatus.success) {
                  var list = context.watch<ClientCubit>().getFiltList();
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                    ),
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (_, i) => GestureDetector(
                      onTap: () =>
                          context.push(Routes.clientAddEdit, extra: list[i]),
                      child: ClientCard(item: list[i]),
                    ),
                  );
                }
                if (state.status == ClientStatus.loading) {
                  return CustomLoading();
                }
                return NoData();
              },
            ),
          ),
        ],
      ),
    );
  }
}
