import 'package:crm_app/app/features/client/data/model/client_response.dart';
import 'package:crm_app/app/features/product/domain/entity/product_entity.dart';
import 'package:crm_app/app/features/warehouse/data/model/warehouse_response.dart';
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

  final WarehouseResponse? sVal;
  final void Function(WarehouseResponse? val)? action;
  final List<WarehouseResponse>? list;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<WarehouseResponse>(
      value: sVal,
      hint: Text("Select"),
      items: list?.map((v) {
        return DropdownMenuItem<WarehouseResponse>(
          value: v,
          child: Text(v.name),
        );
      }).toList(),
      onChanged: action,
    );
  }
}

class ClientDrop extends StatelessWidget {
  const ClientDrop({super.key, this.selectedVal, this.onChanged, this.list});
  final List<ClientResponse>? list;
  final ClientResponse? selectedVal;
  final void Function(ClientResponse? val)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<ClientResponse>(
      value: selectedVal,
      hint: Text("Select"),
      items: list?.map((v) {
        return DropdownMenuItem<ClientResponse>(
          value: v,
          child: Text(v.user.username ?? ""),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}

class ProductDrop<T extends ProductEntity> extends StatelessWidget {
  const ProductDrop({super.key, this.selectedVal, this.list, this.onChanged});
  final T? selectedVal;
  final List<T>? list;
  final void Function(T? val)? onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: selectedVal,
      hint: Text("Select"),
      items: list?.map((v) {
        return DropdownMenuItem<T>(value: v, child: Text(v.name));
      }).toList(),
      onChanged: onChanged,
    );
  }
}

class WPDrop<T extends ProductEntity> extends StatelessWidget {
  const WPDrop({super.key, this.sVal, this.list, this.action});
  final T? sVal;
  final List<T>? list;
  final void Function(T? val)? action;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: sVal,
      hint: Text("Select"),
      items: list?.map((v) {
        return DropdownMenuItem<T>(value: v, child: Text(v.name));
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
