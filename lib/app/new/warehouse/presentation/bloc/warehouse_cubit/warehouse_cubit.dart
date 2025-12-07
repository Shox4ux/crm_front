import 'package:crm_app/app/new/common/data/repo/data_state.dart';
import 'package:crm_app/app/src/data/remote/models/request/warehouse/warehouse_write.dart';
import 'package:crm_app/app/src/data/remote/models/response/warehouse/warehouse_product_read.dart';
import 'package:crm_app/app/src/data/remote/models/response/warehouse/warehouse_read.dart';
import 'package:crm_app/app/src/data/remote/repos/repo/warehouse/warehouse_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'warehouse_state.dart';

class WarehouseCubit extends Cubit<WarehouseState> {
  final WarehouseRepo _wRepo;

  late int _wId;
  late List<WarehouseRead> _filtered;

  WarehouseCubit(this._wRepo)
    : super(WarehouseState(list: [], status: WareStatus.init)) {
    _filtered = [];
    _getAllWarehouse();
  }

  List<WarehouseRead> getFiltList() => _filtered;

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
    emit(state.copyWith(status: WareStatus.loading));
    var res = await _wRepo.getAllWarehouse();
    if (res is DataSuccess) {
      _filtered = res.data ?? [];
      emit(state.copyWith(status: WareStatus.success, list: res.data));
    } else {
      emit(state.copyWith(status: WareStatus.failure, msg: res.errorMsg));
    }
  }

  List<WarehouseProductRead> getWpList() =>
      state.list.where((v) => v.id == _wId).first.products ?? [];

  void createWarehouse(WarehouseWrite body) async {
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

  // void _getAllWareProd() async {}

  // ==========================================================//
  //Warehouse Products Methods

  // Future<void> loadWarehouses() async {
  //   emit(state.copyWith(status: WareStatus.loading));
  //   var data = await _dao.getWList();
  //   _filtered = data;
  //   emit(state.copyWith(list: data, status: WareStatus.init));
  // }

  // Future<void> addWarehouse({String name = "", String address = ""}) async {
  //   var entry = WarehousesCompanion(address: Value(address), name: Value(name));
  //   await _dao.insertWarehouse(entry);

  //   await loadWarehouses();
  // }

  // Future<void> deleteWarehouse(int id) async {
  //   await _dao.deleteWarehouse(id);
  //   await loadWarehouses();
  // }
}
