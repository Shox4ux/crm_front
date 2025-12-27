import 'package:crm_app/app/features/common/data/repo/base_repo.dart';
import 'package:crm_app/app/features/product/data/model/product_response.dart';
import 'package:crm_app/app/features/product/data/model/product_write.dart';
import 'package:crm_app/app/features/product/data/source/remote/product_api_service.dart';

import '../../../common/data/repo/data_state.dart';
import '../../domain/repo/product_repo_impl.dart';

class ProductRepo extends BaseRepo implements ProductRepoImpl {
  ProductRepo(this._service);

  final ProductApiService _service;
  @override
  Future<DataState<ProductResponse>> createProduct({
    required ProductCreate body,
  }) => getStateOf<ProductResponse>(
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
  Future<DataState<List<ProductResponse>>> getAllProduct() =>
      getStateOf<List<ProductResponse>>(
        request: () => _service.getAllProduct(),
      );
  @override
  Future<DataState<ProductResponse>> getProduct({required int id}) =>
      getStateOf<ProductResponse>(
        request: () => _service.getProductById(id: id),
      );

  @override
  Future<DataState> updateProduct({
    required int id,
    required ProductCreate body,
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
}
