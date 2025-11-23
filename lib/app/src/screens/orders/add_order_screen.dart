import 'package:crm_app/app/src/data/remote/models/request/order/order_write.dart';
import 'package:crm_app/app/src/data/remote/models/response/client/client_read.dart';
import 'package:crm_app/app/src/data/remote/models/response/order/order_read.dart';
import 'package:crm_app/app/src/logic/order_cubit/order_cubit.dart';
import 'package:crm_app/app/src/logic/order_product_cubit/order_product_cubit.dart';
import 'package:crm_app/app/src/screens/orders/data/order_row_data.dart';
import 'package:crm_app/app/utils/conts/app_colors.dart';
import 'package:crm_app/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key, this.orderToEdit});

  final OrderRead? orderToEdit;

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  late TextEditingController _paidCtrl;
  late OrderProdCubit _opCubit;
  late OrderCubit _orCubit;

  @override
  void initState() {
    super.initState();
    _paidCtrl = TextEditingController();
    _opCubit = context.read<OrderProdCubit>();
    _orCubit = context.read<OrderCubit>();

    if (widget.orderToEdit != null) {
      _paidCtrl = TextEditingController(
        text: widget.orderToEdit?.paidAmount.toString(),
      );
      _opCubit.setUpWL().then((v) {
        _opCubit.onEdit(widget.orderToEdit!);
      });
    }
    ;
  }

  void _onClient(ClientRead? c) {
    setState(() {
      _opCubit.onSlctClient(c);
    });
  }

  @override
  void dispose() {
    _paidCtrl.dispose();
    _opCubit.close();
    super.dispose();
  }

  String _showTotal() {
    return context.watch<OrderProdCubit>().totalAmount().toString() + " \$";
  }

  void _onCancel() {
    _opCubit.emptyState();
    context.push('/orders');
  }

  void _onConfirm() async {
    var id = _opCubit.state.slctClient!.id;

    var d = OrderWrite(
      clientId: id,
      status: 1,
      paidAmount: double.parse(_paidCtrl.text),
      adminNote: "",
      clientNote: "",
    );

    if (widget.orderToEdit != null) {
      _orCubit.updateOrder(body: d, id: widget.orderToEdit!.id).then((v) {
        _opCubit.updateOrderProdList(widget.orderToEdit!).then((b) {
          Future.delayed(Duration(seconds: 1), () => _orCubit.setUp());
          _opCubit.emptyState();
        });
      });
    } else {
      await _orCubit.createOrder(d).then((i) {
        if (i == -1) return;
        _opCubit.createOrderList(i).then((v) {
          Future.delayed(Duration(seconds: 1), () => _orCubit.setUp());
        });
      });
      _opCubit.emptyState();
    }

    context.push('/orders');
  }

  @override
  Widget build(BuildContext context) {
    _opCubit = context.read<OrderProdCubit>();
    return PopScope(
      onPopInvokedWithResult: (_, _) {
        if (widget.orderToEdit == null) {
          _opCubit.emptyState();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Add Order")),
        body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            spacing: 40,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClientDrop(
                    list: _opCubit.state.cList,
                    selectedVal: _opCubit.state.slctClient,
                    onChanged: _onClient,
                  ),
                  ElevatedButton(
                    onPressed: () => _opCubit.addRow(),
                    child: Text("Add"),
                  ),
                ],
              ),

              Flexible(
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Products: "),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(color: AppColors.cardBgColor),
                        child: SingleChildScrollView(child: OrderRowTable()),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    spacing: 50,
                    children: [
                      CustomDoubleText(b: _showTotal()),
                      CustomField(
                        ctrl: _paidCtrl,
                        hint: "Paid amount",
                        width: 220,
                        height: 90,
                        isMoney: true,
                      ),
                    ],
                  ),

                  Row(
                    spacing: 60,
                    children: [
                      ElevatedButton(
                        onPressed: _onConfirm,
                        child: Text("Confirm"),
                      ),
                      ElevatedButton(
                        onPressed: _onCancel,
                        child: Text("Cancel"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
