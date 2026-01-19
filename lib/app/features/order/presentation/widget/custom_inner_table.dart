import 'package:crm_app/app/features/order/presentation/screens/order_add_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInnerTable extends StatefulWidget {
  const CustomInnerTable({super.key});

  /// COLUMN FLEXES (GLOBAL)
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
  State<CustomInnerTable> createState() => _CustomInnerTableState();
}

class _CustomInnerTableState extends State<CustomInnerTable> {
  final warehouses = ['Warehouse 1', 'Warehouse 2'];

  final Map<String, List<WarehouseProduct>> warehouseProducts = {
    'Warehouse 1': [
      WarehouseProduct('Product X', 12.5, 50),
      WarehouseProduct('Product Y', 20, 30),
    ],
    'Warehouse 2': [WarehouseProduct('Product Z', 15, 40)],
  };

  final List<OrderItemModel> items = [];

  final border = OutlineInputBorder(borderRadius: BorderRadius.circular(10));

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          spacing: 6,
          children: [
            _buildHeader(),
            const SizedBox(height: 8),
            ...items.asMap().entries.map((e) => _buildRow(e.key, e.value)),
          ],
        ),
      ),
    );
  }

  /// ================= HEADER =================
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: const [
          _HeaderCell('#', CustomInnerTable.colNo),
          _HeaderCell('Warehouse', CustomInnerTable.colWarehouse),
          _HeaderCell('Product', CustomInnerTable.colProduct),
          _HeaderCell('Actual Price', CustomInnerTable.colActualPrice),
          _HeaderCell('Price', CustomInnerTable.colPrice),
          _HeaderCell('Stock', CustomInnerTable.colStock),
          _HeaderCell('Quantity', CustomInnerTable.colQty),
          _HeaderCell('Total', CustomInnerTable.colTotal),
          _HeaderCell('Action', CustomInnerTable.colAction),
        ],
      ),
    );
  }

  /// ================= ROW =================
  Widget _buildRow(int index, OrderItemModel item) {
    final products = item.selectedWarehouse == null
        ? <WarehouseProduct>[]
        : warehouseProducts[item.selectedWarehouse!] ?? [];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Row(
        spacing: 8,
        children: [
          _Cell(Text('${index + 1}'), CustomInnerTable.colNo),

          _Cell(
            DropdownButtonFormField<String>(
              initialValue: item.selectedWarehouse,
              decoration: InputDecoration(
                labelText: 'Warehouse',
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
            CustomInnerTable.colWarehouse,
          ),

          _Cell(
            DropdownButtonFormField<WarehouseProduct>(
              initialValue: item.selectedProduct,
              decoration: InputDecoration(labelText: 'Product', border: border),
              items: products
                  .map((p) => DropdownMenuItem(value: p, child: Text(p.name)))
                  .toList(),
              onChanged: (v) {
                item.selectProduct(v);
                setState(() {});
              },
            ),
            CustomInnerTable.colProduct,
          ),

          _Cell(
            Align(
              alignment: Alignment.center,
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
            CustomInnerTable.colActualPrice,
          ),

          _Cell(
            TextFormField(
              controller: item.priceController,
              decoration: InputDecoration(
                labelText: 'Price',
                prefixText: '\$ ',
                border: border,
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              onChanged: (_) => setState(() {}),
            ),
            CustomInnerTable.colPrice,
          ),

          _Cell(
            Center(child: Text("${item.stockQty.toString()} units")),
            CustomInnerTable.colStock,
          ),

          _Cell(
            TextFormField(
              controller: item.qtyController,
              decoration: InputDecoration(
                labelText: 'Quantity',
                prefixText: 'pcs ',
                border: border,
                errorText: item.qtyError, // <-- show error
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (_) {
                item.validateQty(); // <-- validate quantity
                setState(() {});
              },
            ),
            CustomInnerTable.colQty,
          ),

          _Cell(
            Align(
              alignment: Alignment.center,
              child: Text(
                '\$${item.total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            CustomInnerTable.colTotal,
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
            CustomInnerTable.colAction,
          ),
        ],
      ),
    );
  }
}

/// ================= CELL WIDGETS =================
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
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: child,
      ),
    );
  }
}

/// ================= MODELS =================
class OrderItemModel {
  String? selectedWarehouse;
  WarehouseProduct? selectedProduct;
  double? actualPrice;

  final priceController = TextEditingController();
  final qtyController = TextEditingController();

  int stockQty = 0;
  String? qtyError; // <-- quantity validation error

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
    qtyError = null;
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
