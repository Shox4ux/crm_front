import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_bulk_create.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_bulk_update.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_create.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_response.dart';

abstract class ExpenseRepoImpl {
  Future<DataState> createExpense({required ExpenseBulkCreate body});
  Future<DataState<ExpenseResponse>> updateExpense({
    required int id,
    required ExpenseCreate body,
  });
  Future<DataState> deleteExpense({required int id});
  Future<DataState> updateBulkExpense({required ExpenseBulkUpdate body});
}
