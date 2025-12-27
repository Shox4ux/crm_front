import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit() : super(ExpenseInitial());

  //=====================================================//

  void updateBulkExp() async {
    emit(state.copyWith(status: ProdStatus.loading));
    var body = ExpenseBulkUpdate.fromMap(state.changes.toMap());
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
