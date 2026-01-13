import 'package:bloc/bloc.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/warehouse_prod/data/model/ware_pro_create.dart';
import 'package:crm_app/app/features/warehouse_prod/data/model/ware_pro_response.dart';
import 'package:crm_app/app/features/warehouse_prod/domain/entity/ware_pro_entitiy.dart';
import 'package:crm_app/app/features/warehouse_prod/domain/repo/ware_pro_repo.dart';

part 'ware_pro_state.dart';

class WareProCubit extends Cubit<WareProState> {
  final WareProRepo _wpRepo;

  late List<WareProResponse> _filtered;

  WareProCubit(this._wpRepo) : super(WareProState(status: WareProStatus.init)) {
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

  void getAllWareProdByWareId(int wareId) async {
    emit(state.copyWith(status: WareProStatus.loading));
    var res = await _wpRepo.getAllWarehouseProductByWareId(wareId: wareId);
    if (res is DataSuccess) {
      if (res.data == null || res.data!.isEmpty) {
        emit(state.copyWith(status: WareProStatus.empty));
      } else {
        emit(state.copyWith(status: WareProStatus.success, list: res.data));
      }
      _filtered = state.list;
    } else {
      emit(state.copyWith(status: WareProStatus.error, msg: res.errorMsg));
    }
  }

  void addWareProd(WareProCreate body) async {
    emit(state.copyWith(status: WareProStatus.loading));
    var res = await _wpRepo.createWarehouseProduct(body: body);
    if (res is DataSuccess) {
      getAllWareProdByWareId(body.warehouseId);
    } else {
      emit(state.copyWith(status: WareProStatus.error, msg: res.errorMsg));
    }
  }

  void delWareProd(WareProEntitiy item) async {
    emit(state.copyWith(status: WareProStatus.loading));
    var res = await _wpRepo.deleteWarehouseProduct(id: item.id);
    if (res is DataSuccess) {
      getAllWareProdByWareId(item.warehouseId);
    } else {
      emit(state.copyWith(status: WareProStatus.error, msg: res.errorMsg));
    }
  }
}
