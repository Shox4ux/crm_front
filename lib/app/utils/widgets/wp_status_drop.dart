import 'package:crm_app/app/utils/enums/warehouse_product_status.dart';
import 'package:flutter/material.dart';

class WarehouseProdStatusDrop extends StatelessWidget {
  const WarehouseProdStatusDrop({super.key, this.slctdVal, this.onChanged});
  final WarehouseProductStatus? slctdVal;
  final void Function(WarehouseProductStatus? val)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<WarehouseProductStatus>(
      value: slctdVal,
      hint: Text("Select"),
      items: WarehouseProductStatus.values.map((v) {
        return DropdownMenuItem<WarehouseProductStatus>(
          value: v,
          child: Text(v.name),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
