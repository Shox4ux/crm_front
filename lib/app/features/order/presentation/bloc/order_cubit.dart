import 'package:bloc/bloc.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/order/data/model/order_create.dart';
import 'package:crm_app/app/features/order/data/model/order_update.dart';
import 'package:crm_app/app/features/order/domain/entity/order_entity.dart';
import 'package:crm_app/app/features/order/domain/repo/order_repo.dart';
import 'package:crm_app/app/features/order/presentation/utils/order_enum_status.dart';
import 'package:equatable/equatable.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepo _repo;
  late List<OrderEntity> _filtered;
  late List<OrderEntity> _qFiltered;
  late List<OrderEntity> _cFiltered;

  String query = "";

  OrderCubit(this._repo) : super(OrderState()) {
    _filtered = [];
    _qFiltered = [];
    _cFiltered = [];
    getAllOrder();
  }

  void setQuery(String q) {
    query = q;
    print("Query set to: $query");
  }

  List<OrderEntity> getFiltList() => _filtered;

  void complexFilter({
    DateTime? from,
    DateTime? to,
    OrderFilterStatus? status,
  }) {
    var listToFilter = _qFiltered.isNotEmpty ? _qFiltered : state.list ?? [];

    _cFiltered = listToFilter.where((order) {
      final matchesFrom = from == null
          ? true
          : !order.createdAt.isBefore(
              DateTime(from.year, from.month, from.day),
            );

      final matchesTo = to == null
          ? true
          : !order.createdAt.isAfter(
              DateTime(to.year, to.month, to.day, 23, 59, 59),
            );

      final matchesStatus = status == OrderFilterStatus.all
          ? true
          : order.status == status!.index - 1;

      return matchesFrom && matchesTo && matchesStatus;
    }).toList();
    _filtered = _cFiltered;
  }

  void filterResets() {
    if (_qFiltered.isEmpty) {
      _qFiltered = state.list ?? [];
    }
    _cFiltered.clear();
    _filtered = _qFiltered;
  }

  void qFilter(String? query) {
    var listToFilter = _cFiltered.isNotEmpty ? _cFiltered : state.list ?? [];
    if (query != null && query.isNotEmpty) {
      _qFiltered = listToFilter
          .where((c) => c.client!.user.username!.toLowerCase().contains(query))
          .toList();
      _filtered = _qFiltered;
    } else {
      _filtered.clear();
      _filtered = listToFilter;
    }
  }

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
      state.list?.removeWhere((order) => order.id == id);
      getAllOrder();
    } else {
      emit(state.copyWith(status: OrderStatus.error, msg: res.errorMsg));
    }
  }
}
