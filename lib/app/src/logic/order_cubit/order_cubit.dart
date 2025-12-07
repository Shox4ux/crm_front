import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/src/data/remote/models/request/order/order_write.dart';
import 'package:crm_app/app/src/data/remote/models/response/order/order_read.dart';
import 'package:crm_app/app/utils/enums/order_tab_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/remote/repos/repo/api_repos.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepo _repo;
  late List<OrderRead> _filtered;
  late List<OrderRead> _statused;
  late DateTime? _fromDate;
  late DateTime? _toDate;

  OrderCubit(this._repo)
    : super(
        OrderState(
          status: OrderSttStatus.init,
          list: [],
          listSts: OrderTabStatus.accepted,
        ),
      ) {
    _filtered = [];
    _statused = [];
    _fromDate = null;
    _toDate = null;
    _getAllOrder();
  }

  List<OrderRead> getFiltList() => _filtered;

  void setListStatus(OrderTabStatus s) {
    emit(state.copyWith(listStatus: s));
    _sortList();
  }

  void setFromDate(DateTime? from) => _fromDate = from;
  void setToDate(DateTime? to) => _toDate = to;

  bool _statusSort(int inS) {
    if (inS == state.listSts.val) {
      return true;
    }
    return false;
  }

  bool _dateSort(DateTime created) {
    if (_fromDate != null && _toDate != null) {
      return !created.isBefore(_fromDate!) && !created.isAfter(_toDate!);
    } else if (_fromDate != null) {
      return !created.isBefore(_fromDate!); // created >= from
    } else if (_toDate != null) {
      return !created.isAfter(_toDate!); // created <= to
    }
    return true;
  }

  void filter(String? query) {
    if (query != null && query.isNotEmpty) {
      _filtered = _statused
          .where((o) => o.client!.user.username.contains(query))
          .toList();
    } else {
      _filtered.clear();
      _filtered = _statused;
    }
  }

  Future<int> createOrder(OrderWrite body) async {
    var res = await _repo.createOrder(body: body);
    if (res is DataSuccess) {
      return res.data!.id;
    } else {
      return -1;
    }
  }

  Future<void> updateOrder({required OrderWrite body, required int id}) async {
    emit(state.copyWith(status: OrderSttStatus.loading));
    var res = await _repo.updateOrder(id: id, body: body);
    if (res is DataSuccess) {
      _getAllOrder();
    } else {
      emit(state.copyWith(status: OrderSttStatus.error, msg: res.errorMsg));
    }
  }

  void deleteOrder({required int id}) async {
    emit(state.copyWith(status: OrderSttStatus.loading));
    var res = await _repo.deleteOrder(id: id);
    if (res is DataSuccess) {
      _getAllOrder();
    } else {
      emit(state.copyWith(status: OrderSttStatus.error, msg: res.errorMsg));
    }
  }

  void setUp() {
    _getAllOrder();
  }

  void _sortList() {
    var curList = List.of(state.list);

    if (state.listSts == OrderTabStatus.all) {
      _statused = curList;
      _filtered = _statused;
    } else {
      var sorted = curList
          .where((v) => _statusSort(v.status) && _dateSort(v.createdAt))
          .toList();
      _statused = sorted;
      _filtered = _statused;
    }
  }

  void _getAllOrder() async {
    emit(state.copyWith(status: OrderSttStatus.loading));
    var res = await _repo.getAllOrder();
    if (res is DataSuccess) {
      emit(state.copyWith(list: res.data, status: OrderSttStatus.success));
      _sortList();
    } else {
      emit(state.copyWith(status: OrderSttStatus.error, msg: res.errorMsg));
    }
  }
}
