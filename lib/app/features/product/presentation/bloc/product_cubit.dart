import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/product/data/model/product_write.dart';
import 'package:crm_app/app/features/product/domain/entity/product_entity.dart';
import 'package:crm_app/app/features/product/domain/repo/product_repo_impl.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_bulk_update.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_create.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo _repo;
  late List<ProductEntity> _filtered;

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

  List<ProductEntity> getFiltList() => _filtered;

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
    }
  }

  Future<void> updateProduct({required int id}) async {
    emit(state.copyWith(status: ProdStatus.loading));
    var body = ProductCreate.fromMap(state.changes.toMap());
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
    required ProductCreate body,
    List<ProductExpenseCreate>? exps,
  }) async {
    emit(state.copyWith(status: ProdStatus.loading));
    var res = await _repo.createProduct(body: body);

    if (res is DataSuccess) {
      _createExps(res.data!.id, exps);
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
}
