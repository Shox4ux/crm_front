import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/product/data/model/product_create.dart';
import 'package:crm_app/app/features/product/data/repo/product_repo.dart';
import 'package:crm_app/app/features/product/domain/entity/product_entity.dart';
import 'package:crm_app/app/features/product/presentation/data/product_changes.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_bulk_create.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_bulk_update.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_create.dart';
import 'package:crm_app/app/features/product_expense/data/repo/expense_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo _repo;
  final ExpenseRepo _expRepo;
  late List<ProductEntity> _filtered;

  ProductCubit(this._repo, this._expRepo)
    : super(ProductState(changes: ProductChanges())) {
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
      emit(state.copyWith(list: res.data, status: state.isEmpty(res.data)));
    } else {
      emit(state.copyWith(status: ProdStatus.error, msg: res.errorMsg));
    }
  }

  Future<void> updateProduct({required int id}) async {
    emit(state.copyWith(status: ProdStatus.loading));
    var body = ProductCreate.fromMap(state.changes.toJson());
    var res = await _repo.updateProduct(id: id, body: body);
    if (res is DataSuccess) {
      if (state.changes.isNotEmpty()) {
        var expRes = await _expRepo.updateBulkExpense(
          body: ExpenseBulkUpdate.fromJson(state.changes.toJson()),
        );
        if (expRes is DataSuccess) {
          emit(state.copyWith(msg: "Successfully updated"));
        }
      }
      getAllProduct();
    } else {
      emit(state.copyWith(status: ProdStatus.error, msg: res.errorMsg));
    }
  }

  void createProduct({
    required ProductCreate body,
    List<ExpenseCreate>? exps,
  }) async {
    emit(state.copyWith(status: ProdStatus.loading));
    var res = await _repo.createProduct(body: body);
    if (res is DataSuccess) {
      if (exps != null) {
        var expRes = await _expRepo.createExpense(
          body: ExpenseBulkCreate(productId: res.data!.id, items: exps),
        );
        if (expRes is DataSuccess) {
          emit(state.copyWith(msg: "Successfully created"));
        }
      }
      getAllProduct();
    } else {
      emit(state.copyWith(status: ProdStatus.error, msg: res.errorMsg));
    }
  }

  void deleteProduct({required int id}) async {
    emit(state.copyWith(status: ProdStatus.loading));
    var res = await _repo.deleteProduct(id: id);
    if (res is DataSuccess) {
      emit(state.copyWith(msg: "Successfully deleted"));
      getAllProduct();
    } else {
      emit(state.copyWith(status: ProdStatus.error, msg: res.errorMsg));
    }
  }
}
