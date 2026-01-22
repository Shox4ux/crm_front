import 'package:crm_app/app/features/client/domain/entity/client_entity.dart';
import 'package:crm_app/app/features/client/presentation/bloc/client_cubit.dart';
import 'package:crm_app/app/features/common/functions/go_back.dart';
import 'package:crm_app/app/features/common/functions/show_toast.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:crm_app/app/features/common/widget/custom_progress.dart';
import 'package:crm_app/app/features/order/data/model/order_create.dart';
import 'package:crm_app/app/features/order/presentation/bloc/order_cubit.dart';
import 'package:crm_app/app/features/order/presentation/utils/order_enum_status.dart';
import 'package:crm_app/app/features/order/presentation/widget/const_fit.dart';
import 'package:crm_app/app/features/order_product/data/model/order_pro_create.dart';
import 'package:crm_app/app/features/warehouse/domain/entity/warehouse_entity.dart';
import 'package:crm_app/app/features/warehouse/presentation/bloc/warehouse_cubit.dart';
import 'package:crm_app/app/features/warehouse_prod/domain/entity/ware_pro_entitiy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderAddEditScreen extends StatefulWidget {
  final bool isEdit;
  const OrderAddEditScreen({super.key, this.isEdit = false});

  @override
  State<OrderAddEditScreen> createState() => _OrderAddEditScreenState();
}

class _OrderAddEditScreenState extends State<OrderAddEditScreen> {
  List<ClientEntity>? clientList;
  List<WarehouseEntity>? wareList;
  late TextEditingController paidAmountCtrl;
  @override
  void initState() {
    super.initState();
    paidAmountCtrl = TextEditingController();
    //get clients list
    _loadClients();
    _loadWares();
    // //get warehouse list
  }

  @override
  void dispose() {
    paidAmountCtrl.dispose();
    super.dispose();
  }

  void _loadWares() async {
    await context.read<WarehouseCubit>().getAllWarehouse();
    if (!mounted) return;
    setState(() {
      wareList = context.read<WarehouseCubit>().getFiltList();
    });
  }

  Future<void> _loadClients() async {
    await context.read<ClientCubit>().getAllClient();
    if (!mounted) return;
    setState(() {
      clientList = context.read<ClientCubit>().getFiltList();
    });
  }

  ClientEntity? selectedClient;
  OrderEnumStatus? selectedStatus;
  final List<OrderItemModel> items = [];

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: AppColour.stroke, width: 1),
  );

  double get totalAmount => items.fold(0, (sum, i) => sum + i.total);

  void addItem() => setState(() => items.add(OrderItemModel()));

  void createOrder() {
    var b = OrderCreate(
      clientId: selectedClient?.id ?? 0,
      status: selectedStatus?.index ?? 0,
      orderProducts: items
          .map(
            (v) => OrderProCreate(
              customPrice: num.parse(v.priceController.text),
              customQuantity: num.parse(v.qtyController.text),
              warehouseProductId: v.selectedWProduct?.id ?? 0,
            ),
          )
          .toList(),
      paidAmount: double.tryParse(paidAmountCtrl.text) ?? 0,
      adminNote: "",
      clientNote: "",
    );
    context.read<OrderCubit>().createOrder(body: b);
  }

  void updateOrder() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEdit ? 'Edit Order' : 'Create Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 12,
                  children: [
                    SizedBox(
                      width: 280,
                      child: DropdownButtonFormField<ClientEntity>(
                        initialValue: selectedClient,
                        decoration: InputDecoration(
                          labelText: 'Client',
                          border: border,
                        ),
                        items: clientList
                            ?.map(
                              (c) => DropdownMenuItem(
                                value: c,
                                child: Text(c.user.username ?? ""),
                              ),
                            )
                            .toList(),
                        onChanged: widget.isEdit
                            ? null
                            : (v) => setState(() {
                                selectedClient = v;
                                items.clear();
                              }),
                      ),
                    ),
                    SizedBox(
                      width: 280,
                      child: DropdownButtonFormField<OrderEnumStatus>(
                        initialValue: selectedStatus,
                        decoration: InputDecoration(
                          labelText: 'Status',
                          border: border,
                        ),
                        items: OrderEnumStatus.values
                            .map(
                              (c) => DropdownMenuItem(
                                value: c,
                                child: Text(c.name),
                              ),
                            )
                            .toList(),
                        onChanged: widget.isEdit
                            ? null
                            : (v) => setState(() {
                                selectedStatus = v;
                              }),
                      ),
                    ),
                    SizedBox(
                      width: 280,
                      child: TextFormField(
                        controller: paidAmountCtrl,
                        decoration: InputDecoration(
                          hintText: 'Paid Amount',
                          prefixText: '\$ ',
                          border: border,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        onChanged: (_) => setState(() {}),
                      ),
                    ),
                  ],
                ),
                CustomBtn(
                  onPress: selectedClient == null ? null : addItem,
                  txt: 'Add Item',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 6,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 8),
                    ...items.asMap().entries.map(
                      (e) => _buildRow(e.key, e.value),
                    ),
                  ],
                ),
              ),
            ),

            const Divider(thickness: 2),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount: \$ ${totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                BlocConsumer<OrderCubit, OrderState>(
                  listener: (context, state) {
                    if (state.status == OrderStatus.opsuccsess) {
                      goBack(context);
                    }
                    if (state.status == OrderStatus.error) {
                      showToast(context, state.msg ?? "");
                    }
                  },
                  builder: (context, state) {
                    if (state.status == OrderStatus.oploading) {
                      return const CustomLoading();
                    }
                    return Row(
                      spacing: 10,
                      children: [
                        CustomBtn(
                          onPress: () => Navigator.pop(context),
                          txt: 'Cancel',
                        ),
                        CustomBtn(
                          onPress: widget.isEdit ? updateOrder : createOrder,
                          txt: widget.isEdit ? 'Update' : 'Create',
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColour.textFieldBgDark,

        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: const [
          _HeaderCell('#', ConstFit.colNo),
          _HeaderCell('Warehouse', ConstFit.colWarehouse),
          _HeaderCell('Product', ConstFit.colProduct),
          _HeaderCell('Actual Price', ConstFit.colActualPrice),
          _HeaderCell('Price', ConstFit.colPrice),
          _HeaderCell('Stock', ConstFit.colStock),
          _HeaderCell('Quantity', ConstFit.colQty),
          _HeaderCell('Total', ConstFit.colTotal),
          _HeaderCell('Action', ConstFit.colAction),
        ],
      ),
    );
  }

  Widget _buildRow(int index, OrderItemModel item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Row(
        spacing: 16,
        children: [
          _Cell(Text('${index + 1}'), ConstFit.colNo),
          _Cell(
            DropdownButtonFormField<WarehouseEntity>(
              initialValue: item.selectedWarehouse,
              decoration: InputDecoration(
                hintText: 'Warehouse',
                border: border,
              ),
              items: wareList
                  ?.map((w) => DropdownMenuItem(value: w, child: Text(w.name)))
                  .toList(),
              onChanged: (v) {
                setState(() {
                  item.selectWarehouse(v);
                });
              },
            ),
            ConstFit.colWarehouse,
          ),

          _Cell(
            DropdownButtonFormField<WareProEntity>(
              initialValue: item.selectedWProduct,
              decoration: InputDecoration(hintText: 'Product', border: border),
              items: item.selectedWarehouse?.products
                  ?.map(
                    (wp) => DropdownMenuItem(
                      value: wp,
                      child: Text(wp.product?.name ?? ""),
                    ),
                  )
                  .toList(),
              onChanged: (v) {
                setState(() {
                  item.selectProduct(v);
                });
              },
            ),
            ConstFit.colProduct,
          ),

          _Cell(
            Center(
              child: Text(
                item.actualPrice == null
                    ? '-'
                    : '\$${item.actualPrice!.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            ConstFit.colActualPrice,
          ),

          _Cell(
            TextFormField(
              controller: item.priceController,
              decoration: InputDecoration(
                hintText: 'Price',
                prefixText: '\$ ',
                border: border,
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              onChanged: (_) => setState(() {}),
            ),
            ConstFit.colPrice,
          ),

          _Cell(
            Center(child: Text("${item.stockQty} units")),
            ConstFit.colStock,
          ),

          _Cell(
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    item.decrementQty();
                    setState(() {});
                  },
                ),
                Expanded(
                  child: TextFormField(
                    controller: item.qtyController,
                    decoration: InputDecoration(
                      hintText: 'Qty',
                      prefixText: 'pcs ',
                      border: border,
                      errorText: item.qtyError,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (_) {
                      item.validateQty();
                      setState(() {});
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    item.incrementQty();
                    setState(() {});
                  },
                ),
              ],
            ),
            ConstFit.colQty,
          ),

          _Cell(
            Center(
              child: Text(
                '\$${item.total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ConstFit.colTotal,
          ),

          _Cell(
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() => items.removeAt(index));
                },
              ),
            ),
            ConstFit.colAction,
          ),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;
  final int flex;
  const _HeaderCell(this.text, this.flex);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  final Widget child;
  final int flex;
  const _Cell(this.child, this.flex);

  @override
  Widget build(BuildContext context) {
    return Expanded(flex: flex, child: child);
  }
}

class OrderItemModel {
  WarehouseEntity? selectedWarehouse;
  WareProEntity? selectedWProduct;
  List<WareProEntity>? wpList;
  double? actualPrice;
  final priceController = TextEditingController();
  final qtyController = TextEditingController();

  int stockQty = 0;
  String? qtyError;

  void selectWarehouse(WarehouseEntity? v) {
    selectedWarehouse = v;
    selectedWProduct = null;
    stockQty = 0;
    actualPrice = null;
    priceController.clear();
    qtyController.clear();
    qtyError = null;
  }

  void selectProduct(WareProEntity? wp) {
    selectedWProduct = wp;
    stockQty = wp?.quantity ?? 0;
    actualPrice = wp?.product?.sellPrice;
    priceController.text = wp?.product?.sellPrice.toString() ?? '';
    qtyController.text = '0';
    qtyError = null;
  }

  void incrementQty() {
    final q = int.tryParse(qtyController.text) ?? 0;
    if (q < stockQty) {
      qtyController.text = (q + 1).toString();
    }
    validateQty();
  }

  void decrementQty() {
    final q = int.tryParse(qtyController.text) ?? 0;
    if (q > 0) {
      qtyController.text = (q - 1).toString();
    }
    validateQty();
  }

  double get total {
    final p = double.tryParse(priceController.text) ?? 0;
    final q = int.tryParse(qtyController.text) ?? 0;
    return p * q;
  }

  void validateQty() {
    final q = int.tryParse(qtyController.text) ?? 0;
    if (q > stockQty) {
      qtyError = 'Exceeds stock!';
    } else {
      qtyError = null;
    }
  }
}
