import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_bulk.dart';
import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_bulk_update.dart';
import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_write.dart';
import 'package:crm_app/app/src/data/remote/models/request/product/product_write.dart';
import 'package:crm_app/app/src/data/remote/models/response/product/product_read.dart';
import 'package:crm_app/app/src/screens/product/data/add_edit_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/remote/repos/repo/api_repos.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo _repo;
  late List<ProductRead> _filtered;

  ProductCubit(this._repo) : super(ProductState(changes: ProductChanges())) {
    _filtered = [];
    getAllProduct();
  }

  void neutralState() {
    emit(state.copyWith(status: ProdStatus.init));
  }

  void setChanges(ProductChanges changes) {
    var oldState = state;
    var newState = oldState.copyWith(changes: changes);
    emit(newState);
  }

  List<ProductRead> getFiltList() => _filtered;

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

  void getAllProduct() async {
    emit(state.copyWith(status: ProdStatus.loading));
    var res = await _repo.getAllProduct();
    if (res is DataSuccess) {
      _filtered = res.data ?? [];
      emit(state.copyWith(status: ProdStatus.success, list: res.data));
    } else {
      emit(state.copyWith(status: ProdStatus.error, msg: res.errorMsg));

      // if (res.code == 101) {
      //   emit(
      //     state.copyWith(status: ProdStatus.disconnected, msg: res.errorMsg),
      //   );
      // } else {
      // }
    }
  }

  Future<void> updateProduct({required int id}) async {
    emit(state.copyWith(status: ProdStatus.loading));
    var body = ProductWrite.fromMap(state.changes.toMap());
    var res = await _repo.updateProduct(id: id, body: body);
    if (res is DataSuccess) {
      if (!state.changes.isNotEmpty()) {
        getAllProduct();
      }
    } else {
      emit(state.copyWith(status: ProdStatus.error, msg: res.errorMsg));
    }
  }

  void createProduct({
    required ProductWrite body,
    List<ProductExpenseWrite>? exps,
  }) async {
    emit(state.copyWith(status: ProdStatus.loading));
    var res = await _repo.createProduct(body: body);

    if (res is DataSuccess) {
      _createExps(res.data!.id, exps);
      // getAllProduct();
    } else {
      emit(state.copyWith(status: ProdStatus.error, msg: res.errorMsg));
    }
  }

  void deleteProduct({required int id}) async {
    emit(state.copyWith(status: ProdStatus.loading));
    var res = await _repo.deleteProduct(id: id);
    if (res is DataSuccess) {
      getAllProduct();
    } else {
      emit(state.copyWith(status: ProdStatus.error, msg: res.errorMsg));
    }
  }

  //=====================================================//

  void updateBulkExp() async {
    emit(state.copyWith(status: ProdStatus.loading));
    var body = ProdExpBulkUpdate.fromMap(state.changes.toMap());
    var res = await _repo.updateBulkProdExp(body: body);
    if (res is DataSuccess) {
      emit(state.copyWith(status: ProdStatus.success));
      print("product exps updated successfully");

      getAllProduct();
    } else {
      emit(state.copyWith(status: ProdStatus.error, msg: res.errorMsg));
    }
  }

  void _createExps(int pId, List<ProductExpenseWrite>? exps) async {
    var res = await _repo.createProductExp(
      body: ProductExpenseBulk(productId: pId, items: exps),
    );
    if (res is DataSuccess) {
      emit(state.copyWith(status: ProdStatus.success));

      getAllProduct();
    } else {
      emit(state.copyWith(status: ProdStatus.error, msg: res.errorMsg));
    }
  }

  void updateExp(int id, ProductExpenseWrite exps) async {
    emit(state.copyWith(status: ProdStatus.loading));
    var res = await _repo.updateProductExp(id: id, body: exps);
    if (res is DataSuccess) {
      emit(state.copyWith(status: ProdStatus.success));
    } else {
      emit(state.copyWith(status: ProdStatus.error, msg: res.errorMsg));
    }
  }

  void deleteExp(int id) async {
    emit(state.copyWith(status: ProdStatus.loading));
    var res = await _repo.deleteProductExp(id: id);
    if (res is DataSuccess) {
      emit(state.copyWith(status: ProdStatus.success));
    } else {
      emit(state.copyWith(status: ProdStatus.error, msg: res.errorMsg));
    }
  }
}
