import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/warehouse/data/model/warehouse_create.dart';
import 'package:crm_app/app/features/warehouse/domain/repo/warehouse_repo.dart';
import 'package:crm_app/app/features/warehouse_prod/data/model/ware_pro_response.dart';
import 'package:crm_app/app/features/warehouse/data/model/warehouse_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'warehouse_state.dart';

class WarehouseCubit extends Cubit<WarehouseState> {
  final WarehouseRepo _wRepo;

  late int _wId;
  late List<WarehouseResponse> _filtered;

  WarehouseCubit(this._wRepo)
    : super(WarehouseState(list: [], status: WareStatus.init)) {
    _filtered = [];
    _getAllWarehouse();
  }

  List<WarehouseResponse> getFiltList() => _filtered;

  void filter(String? query) {
    if (query != null && query.isNotEmpty) {
      _filtered = state.list
          .where((c) => c.name.toLowerCase().contains(query))
          .toList();
    } else {
      _filtered.clear();
      _filtered = state.list;
    }
  }

  void onWPessed(int id) => _wId = id;
  int getWID() => _wId;

  void _getAllWarehouse() async {
    emit(state.copyWith(status: WareStatus.getall));
    var res = await _wRepo.getAllWarehouse();
    if (res is DataSuccess) {
      _filtered = res.data ?? [];
      emit(state.copyWith(status: WareStatus.success, list: res.data));
    } else {
      emit(state.copyWith(status: WareStatus.failure, msg: res.errorMsg));
    }
  }

  List<WareProResponse> getWpList() =>
      state.list.where((v) => v.id == _wId).first.products ?? [];

  void createWarehouse(WarehouseCreate body) async {
    emit(state.copyWith(status: WareStatus.loading));
    var res = await _wRepo.createWarehouse(body: body);
    if (res is DataSuccess) {
      _getAllWarehouse();
    } else {
      emit(state.copyWith(status: WareStatus.failure, msg: res.errorMsg));
    }
  }

  void deleteWarehouse(int id) async {
    emit(state.copyWith(status: WareStatus.loading));
    var res = await _wRepo.deleteWarehouse(id: id);
    if (res is DataSuccess) {
      _getAllWarehouse();
    } else {
      emit(state.copyWith(status: WareStatus.failure, msg: res.errorMsg));
    }
  }
}
