import 'package:crm_app/actions/action_widgets/enter_action.dart';
import 'package:crm_app/app/features/client/domain/entity/client_entity.dart';
import 'package:crm_app/app/features/client/presentation/bloc/client_cubit.dart';
import 'package:crm_app/app/features/common/extensions/l10n_ext.dart';
import 'package:crm_app/app/features/common/functions/go_back.dart';
import 'package:crm_app/app/features/common/functions/show_toast.dart';
import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:crm_app/app/features/common/widget/custom_progress.dart';
import 'package:crm_app/app/features/order/data/model/order_create.dart';
import 'package:crm_app/app/features/order/data/model/order_update.dart';
import 'package:crm_app/app/features/order/domain/entity/order_entity.dart';
import 'package:crm_app/app/features/order/presentation/bloc/order_cubit.dart';
import 'package:crm_app/app/features/order/presentation/utils/filter_date_formatter.dart';
import 'package:crm_app/app/features/order/presentation/utils/order_enum_status.dart';
import 'package:crm_app/app/features/order/presentation/widget/const_fit.dart';
import 'package:crm_app/app/features/order_product/data/model/order_pro_create.dart';
import 'package:crm_app/app/features/order_product/data/model/order_pro_update.dart';
import 'package:crm_app/app/features/warehouse/domain/entity/warehouse_entity.dart';
import 'package:crm_app/app/features/warehouse/presentation/bloc/warehouse_cubit.dart';
import 'package:crm_app/app/features/warehouse_prod/domain/entity/ware_pro_entitiy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OrderAddEditScreen extends StatefulWidget {
  final bool isEdit;
  final OrderEntity? orderToEdit;
  const OrderAddEditScreen({super.key, this.isEdit = false, this.orderToEdit});

  @override
  State<OrderAddEditScreen> createState() => _OrderAddEditScreenState();
}

class _OrderAddEditScreenState extends State<OrderAddEditScreen> {
  List<ClientEntity>? clients;
  List<WarehouseEntity>? wareList;
  late TextEditingController paidAmountCtrl;
  ClientEntity? selectedClient;
  OrderEnumStatus? selectedStatus;
  List<int> deletedOrderProducts = [];
  List<OrderProUpdate> updatedOrderProducts = [];
  List<OrderProCreate> newOrderProducts = [];
  // =================================>>>>>>>>>>>>
  List<OrderItemModel> orderProds = [];
  bool _clientsLoaded = false;
  bool _waresLoaded = false;
  bool _editInitialized = false;
  late TextEditingController _deliveryOn;
  DateTime? _deliveryOnDate;
  double get totalAmount => orderProds.fold(0, (sum, i) => sum + i.total);
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: AppColour.stroke, width: 1),
  );
  @override
  void initState() {
    super.initState();
    _loadClients();
    _loadWares();
    paidAmountCtrl = TextEditingController(text: '0');
    _deliveryOn = TextEditingController();
  }

  void _tryInitEdit() {
    if (!widget.isEdit) return;
    if (!_clientsLoaded || !_waresLoaded) return;
    if (_editInitialized) return;
    _editInitialized = true;
    _setUpForEditSafe();
  }

  void _setUpForEditSafe() {
    final order = widget.orderToEdit!;
    selectedClient = clients!.firstWhere((c) => c.id == order.client!.id);
    selectedStatus = OrderEnumStatus.values[order.status];
    paidAmountCtrl = TextEditingController(text: order.paidAmount.toString());
    _deliveryOn = TextEditingController(
      text: order.deliveryOn != null
          ? _dateFormatter.format(order.deliveryOn!)
          : '',
    );
    orderProds = order.orderProducts!.map((i) {
      final ware = wareList!.firstWhere(
        (w) => w.id == i.warehouseProduct.warehouse?.id,
      );

      final wp = ware.products!.firstWhere(
        (p) => p.id == i.warehouseProduct.id,
      );

      return OrderItemModel.fromOrderEdit(
        id: i.id,
        selectedWarehouse: ware, // ← from wareList
        selectedWProduct: wp, // ← from ware.products
        wpList: ware.products,
        actualPrice: i.customPrice,
        actualQty: i.customQuantity,
        stockQty: i.warehouseProduct.quantity,
        qtyError: null,
      );
    }).toList();

    setState(() {});
  }

  @override
  void dispose() {
    paidAmountCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadClients() async {
    await context.read<ClientCubit>().getAllClients();
    if (!mounted) return;
    setState(() {
      clients = context.read<ClientCubit>().getFiltList();
      _clientsLoaded = true;
    });

    _tryInitEdit();
  }

  Future<void> _loadWares() async {
    await context.read<WarehouseCubit>().getAllWarehouse();
    if (!mounted) return;

    setState(() {
      wareList = context.read<WarehouseCubit>().getFiltList();
      _waresLoaded = true;
    });

    _tryInitEdit();
  }

  void addItem() => setState(() => orderProds.add(OrderItemModel()));

  List<OrderProCreate>? _getOrProdsForCreateOR() {
    return orderProds
        .map(
          (v) => OrderProCreate(
            customPrice: num.parse(v.priceController.text),
            customQuantity: num.parse(v.qtyController.text),
            warehouseProductId: v.selectedWProduct?.id ?? 0,
          ),
        )
        .toList();
  }

  int _getStatusForCreateOR(double? paidAmount) {
    if (_deliveryOnDate != null && _deliveryOnDate!.isAfter(DateTime.now())) {
      return OrderEnumStatus.prepaid.index;
    } else {
      return (paidAmount == totalAmount)
          ? OrderEnumStatus.paid.index
          : OrderEnumStatus.unpaid.index;
    }
  }

  final DateFormat _dateFormatter = DateFormat('dd.MM.yyyy');

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: _deliveryOnDate,
    );

    if (picked == null) return;

    setState(() {
      _deliveryOnDate = picked;
      _deliveryOn.text = _dateFormatter.format(picked);
      print(_deliveryOnDate);
    });
  }

  void _applyManualDateEdit() {
    _deliveryOnDate = parseDate(_deliveryOn.text);
  }

  void createOrder() {
    if (orderProds.isEmpty) return;
    var paidAmount = double.tryParse(paidAmountCtrl.text);

    var b = OrderCreate(
      clientId: selectedClient?.id ?? 0,
      status: _getStatusForCreateOR(paidAmount),
      orderProducts: _getOrProdsForCreateOR(),
      paidAmount: paidAmount ?? 0,
      adminNote: "",
      clientNote: "",
      totalAmount: totalAmount,
      deliveryOn: _deliveryOnDate ?? DateTime.now(),
    );
    context.read<OrderCubit>().createOrder(body: b);
  }

  void updateOrder() {
    if (widget.isEdit) {
      //================================>>>>>>>>>>>>
      checkIsUpdatedOrderProducts();
      var paidAmount = double.tryParse(paidAmountCtrl.text) ?? 0;
      //================================>>>>>>>>>>>>
      context.read<OrderCubit>().updateOrder(
        body: OrderUpdate(
          deliveryOn: _deliveryOnDate ?? widget.orderToEdit!.deliveryOn!,
          deletedOrderProducts: deletedOrderProducts,
          updatedOrderProducts: updatedOrderProducts,
          newOrderProducts: newOrderProducts,
          status: _getStatusForCreateOR(paidAmount),
          paidAmount: paidAmount,
          adminNote: widget.orderToEdit?.adminNote ?? "",
          clientNote: widget.orderToEdit?.clientNote ?? "",
          totalAmount: totalAmount,
        ),
        id: widget.orderToEdit!.id,
      );
    }
  }

  void checkIsUpdatedOrderProducts() {
    for (var i in orderProds) {
      if (i.isEdited == true && i.id != null) {
        updatedOrderProducts.add(
          OrderProUpdate(
            id: i.id!,
            customPrice: num.parse(i.priceController.text),
            customQuantity: num.parse(i.qtyController.text),
            warehouseProductId: i.selectedWProduct?.id ?? 0,
          ),
        );
      } else if (i.isEdited == true && i.id == null) {
        newOrderProducts.add(
          OrderProCreate(
            customPrice: num.parse(i.priceController.text),
            customQuantity: num.parse(i.qtyController.text),
            warehouseProductId: i.selectedWProduct?.id ?? 0,
          ),
        );
      }
    }
  }

  void deleteOrderProduct(int index) {
    setState(() {
      var toDel = orderProds[index];
      if (widget.isEdit && toDel.id != null) {
        deletedOrderProducts.add(toDel.id ?? 0);
      }
      orderProds.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEdit ? context.l10n.editOrder : context.l10n.createOrder,
        ),
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
                          labelText: context.l10n.client,
                          border: border,
                        ),
                        items: clients
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
                                orderProds.clear();
                              }),
                      ),
                    ),
                    widget.isEdit
                        ? SizedBox(
                            width: 280,
                            child: DropdownButtonFormField<OrderEnumStatus>(
                              initialValue: selectedStatus,
                              decoration: InputDecoration(
                                labelText: context.l10n.status,
                                border: border,
                              ),
                              items: OrderEnumStatus.values
                                  .map(
                                    (c) => DropdownMenuItem(
                                      value: c,
                                      child: Text(c.localizedName(context)),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (v) => setState(() {
                                selectedStatus = v;
                              }),
                            ),
                          )
                        : SizedBox.shrink(),

                    SizedBox(
                      width: 280,
                      child: TextFormField(
                        controller: paidAmountCtrl,
                        decoration: InputDecoration(
                          labelText: context.l10n.paidAmountField,
                          prefixText: '\$ ',
                          border: border,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        onChanged: (_) => setState(() {}),
                      ),
                    ),
                    SizedBox(
                      width: 280,
                      child: TextField(
                        controller: _deliveryOn,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          border: border,
                          labelText: context.l10n.deliveryOn,
                          hintText: 'dd.MM.yyyy',
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        onTap: () => _pickDate(),
                        onChanged: (_) => _applyManualDateEdit(),
                      ),
                    ),
                  ],
                ),
                CustomBtn(
                  onPress: selectedClient == null ? null : addItem,
                  txt: context.l10n.addItem,
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
                    ...orderProds.asMap().entries.map(
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
                  context.l10n.totalAmountLabel(totalAmount.toStringAsFixed(2)),
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
                          txt: context.l10n.cancel,
                        ),
                        EnterAction(
                          onEnter: widget.isEdit ? updateOrder : createOrder,
                          child: CustomBtn(
                            onPress: widget.isEdit ? updateOrder : createOrder,
                            txt: widget.isEdit
                                ? context.l10n.edit
                                : context.l10n.create,
                          ),
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
        children: [
          _HeaderCell('#', ConstFit.colNo),
          _HeaderCell(context.l10n.warehouse, ConstFit.colWarehouse),
          _HeaderCell(context.l10n.product, ConstFit.colProduct),
          _HeaderCell(context.l10n.actualPrice, ConstFit.colActualPrice),
          _HeaderCell(context.l10n.price, ConstFit.colPrice),
          _HeaderCell(context.l10n.stock, ConstFit.colStock),
          _HeaderCell(context.l10n.quantity, ConstFit.colQty),
          _HeaderCell(context.l10n.total, ConstFit.colTotal),
          _HeaderCell(context.l10n.action, ConstFit.colAction),
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
                hintText: context.l10n.warehouseHint,
                border: border,
              ),
              items: wareList
                  ?.map((w) => DropdownMenuItem(value: w, child: Text(w.name)))
                  .toList(),
              onChanged: (v) {
                setState(() {
                  item.selectWarehouse(v, widget.isEdit);
                });
              },
            ),
            ConstFit.colWarehouse,
          ),

          _Cell(
            DropdownButtonFormField<WareProEntity>(
              initialValue: item.selectedWProduct,
              decoration: InputDecoration(
                hintText: context.l10n.product,
                border: border,
              ),
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
                  item.selectProduct(v, widget.isEdit);
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
                hintText: context.l10n.price,
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
            Center(child: Text("${item.stockQty} ${context.l10n.units}")),
            ConstFit.colStock,
          ),

          _Cell(
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    item.decrementQty(widget.isEdit);
                    setState(() {});
                  },
                ),
                Expanded(
                  child: TextFormField(
                    controller: item.qtyController,
                    decoration: InputDecoration(
                      hintText: context.l10n.qty,
                      prefixText: '${context.l10n.units} ',
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
                    item.incrementQty(widget.isEdit);
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
                onPressed: () => deleteOrderProduct(index),
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
  int? id;
  bool? isEdited;
  WarehouseEntity? selectedWarehouse;
  WareProEntity? selectedWProduct;
  List<WareProEntity>? wpList;
  double? actualPrice;
  int? actualQty;
  final priceController = TextEditingController();
  final qtyController = TextEditingController();
  int stockQty = 0;
  String? qtyError;

  OrderItemModel();
  OrderItemModel.fromOrderEdit({
    this.id,
    this.selectedWarehouse,
    this.selectedWProduct,
    this.wpList,
    this.actualPrice,
    this.stockQty = 0,
    this.actualQty,
    this.qtyError,
  }) {
    priceController.text = actualPrice?.toString() ?? '';
    qtyController.text = actualQty.toString();
  }

  OrderItemModel copyWith(
    WarehouseEntity? selectedWarehouse,
    WareProEntity? selectedWProduct,
    List<WareProEntity>? wpList,
    double? actualPrice,
    TextEditingController? priceController,
    TextEditingController? qtyController,
    int stockQty,
    String? qtyError,
  ) => OrderItemModel.fromOrderEdit(
    selectedWarehouse: selectedWarehouse ?? this.selectedWarehouse,
    selectedWProduct: selectedWProduct ?? this.selectedWProduct,
    wpList: wpList ?? this.wpList,
    actualPrice: actualPrice ?? this.actualPrice,
    stockQty: stockQty,
    qtyError: qtyError ?? this.qtyError,
  );

  void selectWarehouse(WarehouseEntity? v, bool? isEdited) {
    selectedWarehouse = v;
    selectedWProduct = null;
    stockQty = 0;
    actualPrice = null;
    priceController.clear();
    qtyController.clear();
    qtyError = null;
    this.isEdited = isEdited;
  }

  void selectProduct(WareProEntity? wp, bool? isEdited) {
    selectedWProduct = wp;
    stockQty = wp?.quantity ?? 0;
    actualPrice = wp?.product?.sellPrice;
    priceController.text = wp?.product?.sellPrice.toString() ?? '';
    qtyController.text = '0';
    qtyError = null;
    this.isEdited = isEdited;
  }

  void incrementQty(bool? isEdited) {
    final q = int.tryParse(qtyController.text) ?? 0;
    if (q < stockQty) {
      qtyController.text = (q + 1).toString();
    }
    validateQty();
    this.isEdited = isEdited;
  }

  void decrementQty(bool? isEdited) {
    final q = int.tryParse(qtyController.text) ?? 0;
    if (q > 0) {
      qtyController.text = (q - 1).toString();
    }
    validateQty();
    this.isEdited = isEdited;
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
