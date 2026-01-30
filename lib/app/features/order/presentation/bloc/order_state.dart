part of 'order_cubit.dart';

enum OrderStatus { init, loading, success, error, empty, oploading, opsuccsess }

class OrderState extends Equatable {
  const OrderState({this.status = OrderStatus.init, this.list, this.msg});
  final OrderStatus status;
  final String? msg;
  final List<OrderEntity>? list;

  OrderState copyWith({
    OrderStatus? status,
    String? msg,
    List<OrderEntity>? list,
  }) {
    return OrderState(
      status: status ?? this.status,
      msg: msg ?? this.msg,
      list: list ?? this.list,
    );
  }

  @override
  List<Object> get props => [status, msg ?? "", list ?? []];
}
