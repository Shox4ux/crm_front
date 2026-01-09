import 'package:bloc/bloc.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/warehouse_prod/data/model/ware_pro_create.dart';
import 'package:crm_app/app/features/warehouse_prod/data/model/ware_pro_response.dart';
import 'package:crm_app/app/features/warehouse_prod/domain/repo/ware_pro_repo.dart';

part 'ware_prod_state.dart';

class WareProdCubit extends Cubit<WareProdState> {
  final WareProRepo _wpRepo;

  late List<WareProResponse> _filtered;

  WareProdCubit(this._wpRepo)
    : super(WareProdState(status: WareProdStatus.init)) {
    _filtered = [];
  }

  List<WareProResponse> getFiltList() => _filtered;

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
      if (res.data == null || res.data!.isEmpty) {
        emit(state.copyWith(status: WareProdStatus.empty));
        return;
      }
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

  void addWareProd(WareProCreate body) async {
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
