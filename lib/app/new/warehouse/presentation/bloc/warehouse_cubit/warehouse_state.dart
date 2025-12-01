// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'warehouse_cubit.dart';

enum WareStatus { init, loading, success, failure }

class WarehouseState {
  final List<WarehouseRead> list;
  final WareStatus status;
  final String? msg;
  WarehouseState({required this.list, required this.status, this.msg});

  WarehouseState copyWith({
    List<WarehouseRead>? list,
    WareStatus? status,
    String? msg,
  }) {
    return WarehouseState(
      list: list ?? this.list,
      status: status ?? this.status,
      msg: msg ?? this.msg,
    );
  }
}
