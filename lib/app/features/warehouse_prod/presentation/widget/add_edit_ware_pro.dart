import 'package:crm_app/actions/action_widgets/enter_action.dart';
import 'package:crm_app/app/features/common/extensions/l10n_ext.dart';
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
  WareProEntity? editData,
  required bool isEdit,
  List<ProductEntity>? prodList,
  int? wareId,
  required GlobalKey<FormState>? key,
}) {
  final List<int> statusInts = [0, 1];
  ProductEntity? selectedProduct = editData?.product;
  ProductStatus? selectedStatus;

  final TextEditingController qtyCtrl = TextEditingController(
    text: editData?.quantity.toString(),
  );

  String title = isEdit
      ? context.l10n.editWareProduct
      : context.l10n.addWareProduct;

  String? validate(dynamic val) {
    if (val == null) {
      return context.l10n.required;
    }
    if (val is String && val.isEmpty) {
      return context.l10n.required;
    }
    if (!isEdit) {
      if (val is String &&
          double.tryParse(val) != null &&
          double.parse(val) > selectedProduct!.activeQuantity) {
        return 'Quantity cannot exceed available stock';
      }
    }

    return null;
  }

  void actionPress() {
    if (key!.currentState!.validate()) {
      var b = WareProCreate(
        warehouseId: wareId!,
        productId: isEdit ? editData!.id : selectedProduct!.id,
        status: selectedStatus?.index ?? ProductStatus.coming.index,
        quantity: int.parse(qtyCtrl.text),
      );
      action(b);
      goBack(context);
    }
  }

  List<DropdownMenuItem<ProductStatus>> statusList() {
    return statusInts.map((intValue) {
      final status = wpStatusFromInt(intValue);
      return DropdownMenuItem(
        value: status,
        child: StatusItem(status: status),
      );
    }).toList();
  }

  List<DropdownMenuItem<ProductEntity>>? genProdList() {
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
              '${context.l10n.qty}: ${product.activeQuantity} | ${context.l10n.price}: \$${product.sellPrice}',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      );
    }).toList();
  }

  List<Widget> buildSelectedItem(BuildContext context) {
    if (prodList == null) return [];
    return prodList.map((product) {
      return Text(product.name);
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
                      DropdownButtonFormField<ProductEntity>(
                        validator: validate,
                        selectedItemBuilder: buildSelectedItem,
                        initialValue: editData?.product,
                        decoration: InputDecoration(
                          labelText: context.l10n.product,
                        ),
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
                        decoration: InputDecoration(
                          labelText: context.l10n.quantity,
                          suffix: Text(
                            "| ${context.l10n.qty} : ${selectedProduct?.activeQuantity ?? 0}",
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<ProductStatus>(
                        decoration: InputDecoration(
                          labelText: context.l10n.status,
                        ),
                        initialValue: wpStatusFromInt(editData?.status),
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
                child: Text(context.l10n.cancel),
              ),
              EnterAction(
                onEnter: actionPress,
                child: ElevatedButton(
                  onPressed: actionPress,
                  child: Text(context.l10n.confirm),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
