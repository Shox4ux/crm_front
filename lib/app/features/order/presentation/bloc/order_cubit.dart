import 'package:bloc/bloc.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/order/data/model/order_create.dart';
import 'package:crm_app/app/features/order/data/model/order_update.dart';
import 'package:crm_app/app/features/order/domain/entity/order_entity.dart';
import 'package:crm_app/app/features/order/domain/repo/order_repo.dart';
import 'package:equatable/equatable.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepo _repo;
  late List<OrderEntity> _filtered;

  OrderCubit(this._repo) : super(OrderState()) {
    _filtered = [];
    getAllOrder();
  }

  List<OrderEntity> getFiltList() => _filtered;

  Future<void> getAllOrder() async {
    emit(state.copyWith(status: OrderStatus.loading));
    var res = await _repo.getAllOrder();
    if (res is DataSuccess) {
      _filtered = res.data ?? [];
      if (res.data == null || res.data!.isEmpty) {
        emit(state.copyWith(status: OrderStatus.empty));
        return;
      }
      emit(state.copyWith(status: OrderStatus.success, list: res.data));
    } else {
      emit(state.copyWith(status: OrderStatus.error, msg: res.errorMsg));
    }
  }

  void createOrder({required OrderCreate body}) async {
    emit(state.copyWith(status: OrderStatus.oploading));
    final res = await _repo.createOrder(body: body);
    if (res is DataSuccess) {
      emit(state.copyWith(status: OrderStatus.opsuccsess));
      getAllOrder();
    } else {
      emit(state.copyWith(status: OrderStatus.error, msg: res.errorMsg));
    }
  }

  void updateOrder({required OrderUpdate body, required int id}) async {
    emit(state.copyWith(status: OrderStatus.oploading));
    final res = await _repo.updateOrder(body: body, id: id);
    if (res is DataSuccess) {
      emit(state.copyWith(status: OrderStatus.opsuccsess));
      getAllOrder();
    } else {
      emit(state.copyWith(status: OrderStatus.error, msg: res.errorMsg));
    }
  }

  void deleteOrder({required int id}) async {
    emit(state.copyWith(status: OrderStatus.loading));
    final res = await _repo.deleteOrder(id: id);
    if (res is DataSuccess) {
      emit(state.copyWith(status: OrderStatus.opsuccsess));
      getAllOrder();
    } else {
      emit(state.copyWith(status: OrderStatus.error, msg: res.errorMsg));
    }
  }
}
