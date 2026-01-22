part of 'order_cubit.dart';

enum OrderStatus { init, loading, success, error, empty, oploading, opsuccsess }

class OrderState extends Equatable {
  const OrderState({this.status = OrderStatus.init, this.orderList, this.msg});
  final OrderStatus status;
  final String? msg;
  final List<OrderEntity>? orderList;

  OrderState copyWith({
    OrderStatus? status,
    String? msg,
    List<OrderEntity>? list,
  }) {
    return OrderState(
      status: status ?? this.status,
      msg: msg ?? this.msg,
      orderList: list ?? orderList,
    );
  }

  @override
  List<Object> get props => [status, msg ?? "", orderList ?? []];
}
