import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_bulk.dart';
import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_bulk_update.dart';
import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_write.dart';
import 'package:crm_app/app/src/data/remote/models/response/product/product_expense_read.dart';
import 'package:crm_app/app/new/product/data/model/product_read.dart';
import 'package:crm_app/app/new/product/data/model/product_write.dart';

import '../../../common/data_state.dart';

abstract class ProductRepo {
  Future<DataState<ProductRead>> createProduct({required ProductWrite body});

  Future<DataState<dynamic>> deleteProduct({required int id});

  Future<DataState<List<ProductRead>>> getAllProduct();

  Future<DataState<ProductRead>> getProduct({required int id});

  Future<DataState<dynamic>> updateProduct({
    required int id,
    required ProductWrite body,
  });

  // =====================Prod Exps====================//

  Future<DataState<dynamic>> createProductExp({
    required ProductExpenseBulk body,
  });

  Future<DataState<ProductExpenseRead>> updateProductExp({
    required int id,
    required ProductExpenseWrite body,
  });

  Future<DataState<dynamic>> updateBulkProdExp({
    required ProdExpBulkUpdate body,
  });

  Future<DataState<dynamic>> deleteProductExp({required int id});
}
