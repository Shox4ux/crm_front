import 'package:bloc/bloc.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/product/presentation/data/product_changes.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_bulk_create.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_bulk_update.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_create.dart';
import 'package:crm_app/app/features/product_expense/data/repo/expense_repo.dart';
part 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  final ExpenseRepo _repo;
  ExpenseCubit(this._repo) : super(ExpenseState(changes: ProductChanges()));

  void updateBulkExp() async {
    emit(state.copyWith(status: ProdStatus.loading));
    var body = ExpenseBulkUpdate.fromJson(state.changes.toJson());
    var res = await _repo.updateBulkExpense(body: body);
    if (res is DataSuccess) {
      emit(state.copyWith(status: ProdStatus.success));
    } else {
      emit(state.copyWith(status: ProdStatus.error, msg: res.errorMsg));
    }
  }

  void createBulkExps(int pId, List<ExpenseCreate>? exps) async {
    var res = await _repo.createExpense(
      body: ExpenseBulkCreate(productId: pId, items: exps),
    );
    if (res is DataSuccess) {
      emit(state.copyWith(status: ProdStatus.success));
    } else {
      emit(state.copyWith(status: ProdStatus.error, msg: res.errorMsg));
    }
  }

  void updateExp(int id, ExpenseCreate exps) async {
    emit(state.copyWith(status: ProdStatus.loading));
    var res = await _repo.updateExpense(id: id, body: exps);
    if (res is DataSuccess) {
      emit(state.copyWith(status: ProdStatus.success));
    } else {
      emit(state.copyWith(status: ProdStatus.error, msg: res.errorMsg));
    }
  }

  void deleteExp(int id) async {
    emit(state.copyWith(status: ProdStatus.loading));
    var res = await _repo.deleteExpense(id: id);
    if (res is DataSuccess) {
      emit(state.copyWith(status: ProdStatus.success));
    } else {
      emit(state.copyWith(status: ProdStatus.error, msg: res.errorMsg));
    }
  }
}
