// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_cubit.dart';

enum OrderSttStatus { init, loading, success, error }

class OrderState {
  final OrderSttStatus status;
  final List<OrderRead> list;
  final String msg;
  final OrderTabStatus listSts;
  OrderState({
    required this.status,
    required this.list,
    this.msg = "",
    required this.listSts,
  });

  OrderState copyWith({
    OrderSttStatus? status,
    List<OrderRead>? list,
    String? msg,
    OrderTabStatus? listStatus,
  }) {
    return OrderState(
      status: status ?? this.status,
      list: list ?? this.list,
      msg: msg ?? this.msg,
      listSts: listStatus ?? this.listSts,
    );
  }
}
