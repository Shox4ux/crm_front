import 'package:crm_app/app/features/common/functions/go_back.dart';
import 'package:crm_app/app/features/common/widget/dialog_title.dart';
import 'package:crm_app/app/features/product/domain/entity/product_entity.dart';
import 'package:crm_app/app/features/warehouse_prod/data/model/ware_pro_create.dart';
import 'package:crm_app/app/features/warehouse_prod/domain/entity/ware_pro_entitiy.dart';
import 'package:crm_app/app/features/warehouse_prod/presentation/widget/enums.dart';
import 'package:flutter/material.dart';

/* ===================== DIALOG ===================== */

void showWareProductDialog(
  BuildContext context, {
  required Function(WareProCreate data) action,
  WareProEntitiy? editData,
  required bool isEdit,
  List<ProductEntity>? prodList,
  int? wareId,
  required GlobalKey<FormState>? key,
}) {
  final List<int> statusInts = [1, 2, 3];
  ProductEntity? selectedProduct;
  ProductStatus? selectedStatus;

  final TextEditingController qtyCtrl = TextEditingController(
    text: editData?.quantity.toString(),
  );

  String title = isEdit ? 'Edit Ware Product' : 'Add Ware Product';

  String? validate(dynamic val) {
    if (val == null) {
      return 'Required';
    }
    if (val is String && val.isEmpty) {
      return 'Required';
    }
    return null;
  }

  void actionPress() {
    if (key!.currentState!.validate()) {
      var b = WareProCreate(
        warehouseId: wareId!,
        productId: isEdit ? editData!.warehouseId : selectedProduct!.id,
        status: selectedStatus?.index ?? ProductStatus.pending.index,
        quantity: int.parse(qtyCtrl.text),
      );
      action(b);
      goBack(context);
    }
  }

  dynamic statusList() {
    return statusInts.map((intValue) {
      final status = statusFromInt(intValue);
      return DropdownMenuItem(
        value: status,
        child: StatusItem(status: status),
      );
    }).toList();
  }

  dynamic genProdList() {
    return prodList?.map((product) {
      return DropdownMenuItem(
        value: product,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Qty: ${product.activeQuantity} | Price: \$${product.sellPrice}',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      );
    }).toList();
  }

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: DialogTitle(title: title),

            content: SingleChildScrollView(
              child: SizedBox(
                width: 400,
                child: Form(
                  key: key,
                  child: Column(
                    children: [
                      /// PRODUCT DROPDOWN
                      DropdownButtonFormField<ProductEntity>(
                        validator: validate,
                        selectedItemBuilder: (context) {
                          if (prodList == null) return [];
                          return prodList.map((product) {
                            return Text(product.name);
                          }).toList();
                        },
                        initialValue: editData?.product,
                        decoration: const InputDecoration(labelText: 'Product'),
                        items: genProdList(),
                        onChanged: (value) {
                          setState(() {
                            selectedProduct = value;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        validator: validate,
                        controller: qtyCtrl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Custom Quantity',
                        ),
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<ProductStatus>(
                        decoration: const InputDecoration(labelText: 'Status'),
                        initialValue: statusFromInt(editData?.status),
                        items: statusList(),
                        validator: validate,
                        onChanged: (value) {
                          setState(() {
                            selectedStatus = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => goBack(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: actionPress,
                child: const Text('Confirm'),
              ),
            ],
          );
        },
      );
    },
  );
}
