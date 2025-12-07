import 'package:crm_app/app/new/common/widget/custom_progress.dart';
import 'package:crm_app/app/new/common/widget/custon_no_data.dart';
import 'package:crm_app/app/src/data/remote/models/request/order/order_write.dart';
import 'package:crm_app/app/src/data/remote/models/response/order/order_prod_read.dart';
import 'package:crm_app/app/src/data/remote/models/response/order/order_read.dart';
import 'package:crm_app/app/src/logic/logic.dart';
import 'package:crm_app/app/utils/conts/app_colors.dart';
import 'package:crm_app/app/utils/enums/order_status.dart';
import 'package:crm_app/app/utils/enums/order_tab_status.dart';
import 'package:crm_app/app/utils/extensions/date_to_txt.dart';
import 'package:crm_app/app/utils/utils.dart';
import 'package:crm_app/app/utils/widgets/from_to_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

List<String> _colmns = [
  "Product Name",
  "Buy Price",
  "Sell Price",
  "Sold Price",
  "Quantity",
];

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  late final OrderCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<OrderCubit>();
    super.initState();
  }

  void _onTab(OrderTabStatus status) {
    setState(() {
      _cubit.setListStatus(status);
    });
  }

  void _search(String val) {
    setState(() {
      _cubit.filter(val);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(40),
        child: Column(
          spacing: 40,
          children: [
            Column(
              children: [
                CustomSearchAdd(
                  onSearch: _search,
                  btnTxt: "Add Order",
                  onAdd: () => context.push("/add_order"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 20,
                      children: OrderTabStatus.values.map((status) {
                        final bool isSelected = status == _cubit.state.listSts;
                        return GestureDetector(
                          onTap: () => _onTab(status),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.black : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Text(
                              status.name.toUpperCase(),
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    FromToDate(),
                  ],
                ),
              ],
            ),

            BlocBuilder<OrderCubit, OrderState>(
              builder: (context, state) {
                var list = _cubit.getFiltList();
                if (state.status == OrderSttStatus.loading) {
                  return Expanded(child: CustomProgress());
                }
                if (list.isEmpty) {
                  return Expanded(child: NoData());
                }
                return Flexible(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (c, i) => OrderListItem(order: list[i]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------------------------------------------------------------------------->

class OrderListItem extends StatefulWidget {
  const OrderListItem({super.key, required this.order});
  final OrderRead order;

  @override
  State<OrderListItem> createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  void _onStatus(OrderStatus? status) {
    var b = OrderWrite(
      clientId: widget.order.client!.id,
      status: status!.index,
      paidAmount: widget.order.paidAmount,
    );

    context.read<OrderCubit>().updateOrder(body: b, id: widget.order.id);
  }

  void _onDelete() {
    context.read<OrderCubit>().deleteOrder(id: widget.order.id);
  }

  void _onEdit() {
    context.push("/add_order", extra: widget.order);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.cardBgColor,
        border: BoxBorder.all(color: AppColors.appBlack, width: 1),
      ),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 30,
                    children: [
                      CustomDoubleText(
                        ttl: "Name: ",
                        b: widget.order.client?.user.username ?? "",
                      ),
                      CustomDoubleText(
                        ttl: "Phone: ",
                        b: widget.order.client?.phone ?? "",
                      ),
                      CustomDoubleText(
                        isNum: true,
                        ttl: "Total amount: ",
                        b: "${widget.order.paidAmount}",
                      ),
                      CustomDoubleText(
                        isNum: true,
                        ttl: "Paid Amount: ",
                        b: "${widget.order.paidAmount}",
                      ),
                      CustomDoubleText(
                        ttl: "Date: ",
                        b: widget.order.createdAt.toTxt(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 10,
                    children: [
                      OrderStatusDrop(
                        slctdVal: OrderStatus.fromInt(widget.order.status),
                        onChanged: _onStatus,
                      ),
                      IconButton(onPressed: _onEdit, icon: Icon(Icons.edit)),
                      IconButton(
                        onPressed: _onDelete,
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: OrderTableView(list: widget.order.orderProducts ?? []),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Data table
class OrderTableView extends StatelessWidget {
  const OrderTableView({super.key, required this.list});
  final List<OrderProdRead> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      child: list.isEmpty
          ? Text("data")
          : DataTable(
              columns: List.generate(
                _colmns.length,
                (i) => _proCol(_colmns[i]),
              ),
              rows: List.generate(list.length, (i) => _proCells(list[i])),
            ),
    );
  }
}

DataColumn _proCol(String title) {
  return DataColumn(
    label: Expanded(
      child: Text(title, style: TextStyle(fontStyle: FontStyle.italic)),
    ),
  );
}

DataRow _proCells(OrderProdRead op) {
  return DataRow(
    cells: [
      DataCell(Text(op.warehouseProduct.product!.name)),
      DataCell(Text("${op.warehouseProduct.product!.basePrice} \$")),
      DataCell(Text("${op.warehouseProduct.product!.sellPrice} \$")),
      DataCell(Text("${op.customPrice} \$")),
      DataCell(Text(op.customQuantity.toString())),
    ],
  );
}
