import 'package:bloc/bloc.dart';
import 'package:crm_app/app/new/common/data/repo/data_state.dart';
import 'package:crm_app/app/src/data/remote/models/request/warehouse/warehouse_product_write.dart';
import 'package:crm_app/app/src/data/remote/models/response/warehouse/warehouse_product_read.dart';
import 'package:crm_app/app/src/data/remote/repos/repo/warehouse_product/warehouse_product_repo.dart';

part 'ware_prod_state.dart';

class WareProdCubit extends Cubit<WareProdState> {
  final WarehouseProductRepo _wpRepo;

  late List<WarehouseProductRead> _filtered;

  WareProdCubit(this._wpRepo)
    : super(WareProdState(status: WareProdStatus.init)) {
    _filtered = [];
  }

  List<WarehouseProductRead> getFiltList() => _filtered;

  void filter(String? query) {
    if (query != null && query.isNotEmpty) {
      var filtered = state.list
          .where(
            (c) =>
                c.product?.name.toLowerCase().contains(query.toLowerCase()) ??
                false,
          )
          .toList();
      _filtered = filtered;
    } else {
      _filtered.clear();
      _filtered = state.list;
    }
  }

  void getAllWarehouseProductByWareId({required int wareId}) async {
    emit(state.copyWith(status: WareProdStatus.loading));
    var res = await _wpRepo.getAllWarehouseProductByWareId(wareId: wareId);
    if (res is DataSuccess) {
      emit(state.copyWith(status: WareProdStatus.success, list: res.data));
    } else {
      emit(state.copyWith(status: WareProdStatus.error, msg: res.errorMsg));
    }
  }

  void getAllWareProdByWareId(int wareId) async {
    emit(state.copyWith(status: WareProdStatus.loading));
    var res = await _wpRepo.getAllWarehouseProductByWareId(wareId: wareId);
    if (res is DataSuccess) {
      emit(state.copyWith(status: WareProdStatus.success, list: res.data));
      _filtered = state.list;
    } else {
      emit(state.copyWith(status: WareProdStatus.error, msg: res.errorMsg));
    }
  }

  void addWareProd(WarehouseProductWrite body) async {
    emit(state.copyWith(status: WareProdStatus.loading));
    var res = await _wpRepo.createWarehouseProduct(body: body);
    if (res is DataSuccess) {
      getAllWareProdByWareId(body.warehouseId);
    } else {
      emit(state.copyWith(status: WareProdStatus.error, msg: res.errorMsg));
    }
  }

  void delWareProd(int id) async {
    emit(state.copyWith(status: WareProdStatus.loading));
    var res = await _wpRepo.deleteWarehouseProduct(id: id);
    if (res is DataSuccess) {
    } else {
      emit(state.copyWith(status: WareProdStatus.error, msg: res.errorMsg));
    }
  }

  void clearState() {
    emit(WareProdState(status: WareProdStatus.init));
  }
}
