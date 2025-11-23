import 'package:crm_app/app/src/data/remote/models/response/client/client_read.dart';
import 'package:crm_app/app/src/data/remote/models/response/product/product_read.dart';
import 'package:crm_app/app/src/data/remote/models/response/warehouse/warehouse_product_read.dart';
import 'package:crm_app/app/src/data/remote/models/response/warehouse/warehouse_read.dart';
import 'package:crm_app/app/utils/enums/admin_permission.dart';
import 'package:crm_app/app/utils/enums/order_status.dart';
import 'package:flutter/material.dart';

class OrderStatusDrop extends StatelessWidget {
  const OrderStatusDrop({
    super.key,
    required this.slctdVal,
    required this.onChanged,
  });
  final OrderStatus? slctdVal;
  final void Function(OrderStatus? val) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<OrderStatus>(
      hint: Text("Select"),
      value: slctdVal,
      items: OrderStatus.values.map((v) {
        return DropdownMenuItem<OrderStatus>(value: v, child: Text(v.value));
      }).toList(),
      onChanged: onChanged,
    );
  }
}

class WDrop extends StatelessWidget {
  const WDrop({super.key, this.sVal, this.action, this.list});

  final WarehouseRead? sVal;
  final void Function(WarehouseRead? val)? action;
  final List<WarehouseRead>? list;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<WarehouseRead>(
      value: sVal,
      hint: Text("Select"),
      items: list?.map((v) {
        return DropdownMenuItem<WarehouseRead>(value: v, child: Text(v.name));
      }).toList(),
      onChanged: action,
    );
  }
}

class ClientDrop extends StatelessWidget {
  const ClientDrop({super.key, this.selectedVal, this.onChanged, this.list});
  final List<ClientRead>? list;
  final ClientRead? selectedVal;
  final void Function(ClientRead? val)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<ClientRead>(
      value: selectedVal,
      hint: Text("Select"),
      items: list?.map((v) {
        return DropdownMenuItem<ClientRead>(
          value: v,
          child: Text(v.user.username),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}

class ProductDrop extends StatelessWidget {
  const ProductDrop({super.key, this.selectedVal, this.list, this.onChanged});
  final ProductRead? selectedVal;
  final List<ProductRead>? list;
  final void Function(ProductRead? val)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<ProductRead>(
      value: selectedVal,
      hint: Text("Select"),
      items: list?.map((v) {
        return DropdownMenuItem<ProductRead>(value: v, child: Text(v.name));
      }).toList(),
      onChanged: onChanged,
    );
  }
}

class WPDrop extends StatelessWidget {
  const WPDrop({super.key, this.sVal, this.list, this.action});
  final WarehouseProductRead? sVal;
  final List<WarehouseProductRead>? list;
  final void Function(WarehouseProductRead? val)? action;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<WarehouseProductRead>(
      value: sVal,
      hint: Text("Select"),
      items: list?.map((v) {
        return DropdownMenuItem<WarehouseProductRead>(
          value: v,
          child: Text(v.product?.name ?? ""),
        );
      }).toList(),
      onChanged: action,
    );
  }
}

class PermissionDrop extends StatelessWidget {
  const PermissionDrop({super.key, this.slctdVal, this.onChanged});
  final AdminPermission? slctdVal;
  final void Function(AdminPermission? val)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<AdminPermission>(
      value: slctdVal,
      hint: Text("Select"),
      items: AdminPermission.values.map((v) {
        return DropdownMenuItem<AdminPermission>(value: v, child: Text(v.name));
      }).toList(),
      onChanged: onChanged,
    );
  }
}
