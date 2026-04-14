part of 'cancel_order_cubit.dart';

enum OrderCancelStatus { init, loading, success, error }

class OrderCancelState extends Equatable {
  const OrderCancelState({this.msg, this.status = OrderCancelStatus.init});
  final String? msg;
  final OrderCancelStatus status;

  OrderCancelState copyWith({String? msg, OrderCancelStatus? status}) {
    return OrderCancelState(
      status: status ?? this.status,
      msg: msg ?? this.msg,
    );
  }

  @override
  List<Object> get props => [status];
}
