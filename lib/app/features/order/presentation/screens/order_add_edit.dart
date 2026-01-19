import 'package:crm_app/app/features/common/ui/app_colour.dart';
import 'package:crm_app/app/features/common/widget/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrderAddEditScreen extends StatefulWidget {
  final bool isEdit;
  const OrderAddEditScreen({super.key, this.isEdit = false});

  @override
  State<OrderAddEditScreen> createState() => _OrderAddEditScreenState();
}

class _OrderAddEditScreenState extends State<OrderAddEditScreen> {
  // late final List<ClientEntity> clientList;
  // late final List<WarehouseEntity> wareList;

  @override
  void initState() {
    super.initState();
    //get clients list
    // context.read<ClientCubit>().getAllClient();
    // clientList = context.read<ClientCubit>().getFiltList();
    // //get warehouse list
    // context.read<WarehouseCubit>().getAllWarehouse();
    // wareList = context.read<WarehouseCubit>().getFiltList();
    // //get warehouse products list
    // context.read<WarehouseCubit>().getAllWarehouse();
    // wareList = context.read<WarehouseCubit>().getFiltList();
  }

  String? selectedClient;

  final clients = ['Client A', 'Client B'];
  final warehouses = ['Warehouse 1', 'Warehouse 2'];

  final Map<String, List<WarehouseProduct>> warehouseProducts = {
    'Warehouse 1': [
      WarehouseProduct('Product X', 12.5, 50),
      WarehouseProduct('Product Y', 20, 30),
    ],
    'Warehouse 2': [WarehouseProduct('Product Z', 15, 40)],
  };

  final List<OrderItemModel> items = [];

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: AppColour.stroke, width: 1),
  );

  double get totalAmount => items.fold(0, (sum, i) => sum + i.total);

  void addItem() => setState(() => items.add(OrderItemModel()));

  static const colNo = 1;
  static const colWarehouse = 4;
  static const colProduct = 4;
  static const colActualPrice = 2;
  static const colPrice = 3;
  static const colStock = 2;
  static const colQty = 3;
  static const colTotal = 2;
  static const colAction = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEdit ? 'Edit Order' : 'Create Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 280,
                  child: DropdownButtonFormField<String>(
                    initialValue: selectedClient,
                    decoration: InputDecoration(
                      labelText: 'Client',
                      border: border,
                    ),
                    items: clients
                        .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                        .toList(),
                    onChanged: widget.isEdit
                        ? null
                        : (v) => setState(() {
                            selectedClient = v;
                            items.clear();
                          }),
                  ),
                ),
                const Spacer(),
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
            const SizedBox(height: 20),
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
                Row(
                  spacing: 10,
                  children: [
                    CustomBtn(
                      onPress: () => Navigator.pop(context),
                      txt: 'Cancel',
                    ),
                    CustomBtn(
                      onPress: () {},
                      txt: widget.isEdit ? 'Update' : 'Create',
                    ),
                  ],
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
          _HeaderCell('#', colNo),
          _HeaderCell('Warehouse', colWarehouse),
          _HeaderCell('Product', colProduct),
          _HeaderCell('Actual Price', colActualPrice),
          _HeaderCell('Price', colPrice),
          _HeaderCell('Stock', colStock),
          _HeaderCell('Quantity', colQty),
          _HeaderCell('Total', colTotal),
          _HeaderCell('Action', colAction),
        ],
      ),
    );
  }

  Widget _buildRow(int index, OrderItemModel item) {
    final products = item.selectedWarehouse == null
        ? <WarehouseProduct>[]
        : warehouseProducts[item.selectedWarehouse!] ?? [];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Row(
        spacing: 16,
        children: [
          _Cell(Text('${index + 1}'), colNo),

          _Cell(
            DropdownButtonFormField<String>(
              initialValue: item.selectedWarehouse,
              decoration: InputDecoration(
                hintText: 'Warehouse',
                border: border,
              ),
              items: warehouses
                  .map((w) => DropdownMenuItem(value: w, child: Text(w)))
                  .toList(),
              onChanged: (v) {
                item.selectWarehouse(v);
                setState(() {});
              },
            ),
            colWarehouse,
          ),

          _Cell(
            DropdownButtonFormField<WarehouseProduct>(
              initialValue: item.selectedProduct,
              decoration: InputDecoration(hintText: 'Product', border: border),
              items: products
                  .map((p) => DropdownMenuItem(value: p, child: Text(p.name)))
                  .toList(),
              onChanged: (v) {
                item.selectProduct(v);
                setState(() {});
              },
            ),
            colProduct,
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
            colActualPrice,
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
            colPrice,
          ),

          _Cell(Center(child: Text("${item.stockQty} units")), colStock),

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
            colQty,
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
            colTotal,
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
            colAction,
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
  String? selectedWarehouse;
  WarehouseProduct? selectedProduct;
  double? actualPrice;

  final priceController = TextEditingController();
  final qtyController = TextEditingController();

  int stockQty = 0;
  String? qtyError;

  void selectWarehouse(String? v) {
    selectedWarehouse = v;
    selectedProduct = null;
    stockQty = 0;
    actualPrice = null;
    priceController.clear();
    qtyController.clear();
    qtyError = null;
  }

  void selectProduct(WarehouseProduct? p) {
    selectedProduct = p;
    stockQty = p?.quantity ?? 0;
    actualPrice = p?.price;
    priceController.text = p?.price.toString() ?? '';
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

class WarehouseProduct {
  final String name;
  final double price;
  final int quantity;
  WarehouseProduct(this.name, this.price, this.quantity);
}
