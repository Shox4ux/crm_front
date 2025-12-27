import 'package:crm_app/app/features/common/data/repo/base_repo.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_bulk_create.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_bulk_update.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_create.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_response.dart';
import 'package:crm_app/app/features/product_expense/data/source/expense_api_service.dart';
import 'package:crm_app/app/features/product_expense/domain/repo/expense_repo_impl.dart';

class ExpenseRepo extends BaseRepo implements ExpenseRepoImpl {
  final ExpenseApiService _service;
  ExpenseRepo(this._service);

  @override
  Future<DataState> createExpense({required ExpenseBulkCreate body}) =>
      getStateOf(request: () => _service.createProductExp(body: body));
  @override
  Future<DataState<ExpenseResponse>> updateExpense({
    required int id,
    required ExpenseCreate body,
  }) => getStateOf(
    request: () => _service.updateProductExp(id: id, body: body),
  );
  @override
  Future<DataState> deleteExpense({required int id}) =>
      getStateOf(request: () => _service.deleteProductExp(id: id));
  @override
  Future<DataState> updateBulkExpense({required ExpenseBulkUpdate body}) =>
      getStateOf(request: () => _service.updateBulkProductExp(body: body));
}
