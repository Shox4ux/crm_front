import 'package:crm_app/app/src/data/remote/models/response/client/client_read.dart';
import 'package:crm_app/app/src/logic/logic.dart';
import 'package:crm_app/app/utils/enums/order_status.dart';
import 'package:crm_app/app/utils/funcs/show_toast.dart';
import 'package:crm_app/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientInfoScreen extends StatefulWidget {
  const ClientInfoScreen({super.key});

  @override
  State<ClientInfoScreen> createState() => _ClientInfoScreenState();
}

class _ClientInfoScreenState extends State<ClientInfoScreen>
    with TickerProviderStateMixin {
  late TabController _tabCtrl;
  late TextEditingController _customPrcCtrl;
  late TextEditingController _originPrcCtrl;
  OrderStatus? _orderStts;

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 2, vsync: this);
    _customPrcCtrl = TextEditingController();
    _originPrcCtrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _tabCtrl.dispose();
    _customPrcCtrl.dispose();
    _originPrcCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Client Page")),
      body: Container(
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(color: Colors.white),
        child: BlocConsumer<ClientCubit, ClientState>(
          listener: (context, state) {
            if (state.status == ClientStatus.error) {
              showToast(context, state.msg ?? "");
            }
            if (state.status == ClientStatus.success) {
              setState(() {});
            }
          },
          builder: (context, state) {
            var c = state.slctClient;
            return Column(
              spacing: 20,
              children: [
                UserInfo(c: c),
                TabBar.secondary(
                  controller: _tabCtrl,
                  tabs: [
                    Tab(text: 'Products'),
                    Tab(text: 'Orders'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabCtrl,
                    children: [
                      Flexible(
                        child: BlocBuilder<ClientCubit, ClientState>(
                          builder: (context, state) {
                            // if (state.status == ClientStatus.loading) {
                            //   return CusProgress();
                            // }
                            var list = state.slctClient?.products ?? [];
                            if (list.isEmpty) {
                              return NoData();
                            }
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5,
                                    ),
                                itemCount: list.length,
                                itemBuilder: (_, i) => ProductCard(
                                  product: list[i].product!,
                                  cp: list[i],
                                  user: c?.user,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            spacing: 20,
                            children: [
                              OrderStatusDrop(
                                slctdVal: _orderStts,
                                onChanged: (val) {
                                  setState(() {
                                    _orderStts = val;
                                  });
                                },
                              ),
                              Text("Here will be from-to filter"),
                            ],
                          ),
                          c?.orders != []
                              ? Flexible(
                                  child: ListView.builder(
                                    itemCount: 10,
                                    itemBuilder: (_, i) => Text("data$i"),
                                    // OrderListItem(order: c.orders[i], i: i),
                                  ),
                                )
                              : Center(child: Text("No Data Found")),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.c});

  final ClientRead? c;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 30,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            CustomDoubleText(ttl: "Username: ", b: c?.user.username ?? ""),
            CustomDoubleText(ttl: "Password: ", b: c?.user.password ?? ""),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            CustomDoubleText(ttl: "Phone: ", b: c?.phone ?? ""),
            CustomDoubleText(ttl: "Address: ", b: c?.address ?? ""),
          ],
        ),
      ],
    );
  }
}
