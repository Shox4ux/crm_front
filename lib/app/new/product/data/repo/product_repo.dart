import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_bulk.dart';
import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_bulk_update.dart';
import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_write.dart';
import 'package:crm_app/app/src/data/remote/models/response/product/product_expense_read.dart';
import 'package:crm_app/app/new/common/data/repo/base_repo.dart';
import 'package:crm_app/app/new/product/data/model/product_read.dart';
import 'package:crm_app/app/new/product/data/model/product_write.dart';
import 'package:crm_app/app/new/product/data/source/remote/product_api_service.dart';

import '../../../common/data/repo/data_state.dart';
import '../../domain/repo/product_repo_impl.dart';

class ProductRepoImpl extends BaseRepo implements ProductRepo {
  ProductRepoImpl(this._service);

  final ProductApiService _service;
  @override
  Future<DataState<ProductRead>> createProduct({required ProductWrite body}) =>
      getStateOf<ProductRead>(
        request: () => _service.createProduct(
          totalQuantity: body.totalQuantity!,
          activeQuantity: body.activeQuantity!,
          measure: 0,
          img: body.img,
          name: body.name!,
          basePrice: body.basePrice!,
          sellPrice: body.sellPrice!,
        ),
      );
  @override
  Future<DataState<dynamic>> deleteProduct({required int id}) =>
      getStateOf<dynamic>(request: () => _service.deleteProduct(id: id));
  @override
  Future<DataState<List<ProductRead>>> getAllProduct() =>
      getStateOf<List<ProductRead>>(request: () => _service.getAllProduct());
  @override
  Future<DataState<ProductRead>> getProduct({required int id}) =>
      getStateOf<ProductRead>(request: () => _service.getProductById(id: id));

  @override
  Future<DataState> updateProduct({
    required int id,
    required ProductWrite body,
  }) => getStateOf(
    request: () => _service.updateProduct(
      id: id,
      totalQuantity: body.totalQuantity,
      activeQuantity: body.activeQuantity,
      img: body.img,
      name: body.name,
      basePrice: body.basePrice,
      sellPrice: body.sellPrice,
    ),
  );

  // ============================================================//
  @override
  Future<DataState<dynamic>> deleteProductExp({required int id}) =>
      getStateOf<dynamic>(request: () => _service.deleteProductExp(id: id));

  @override
  Future<DataState<ProductExpenseRead>> updateProductExp({
    required int id,
    required ProductExpenseWrite body,
  }) => getStateOf<ProductExpenseRead>(
    request: () => _service.updateProductExp(id: id, body: body),
  );

  @override
  Future<DataState<dynamic>> createProductExp({
    required ProductExpenseBulk body,
  }) => getStateOf(request: () => _service.createProductExp(body: body));

  @override
  Future<DataState> updateBulkProdExp({required ProdExpBulkUpdate body}) =>
      getStateOf(request: () => _service.updateBulkProductExp(body: body));
}
