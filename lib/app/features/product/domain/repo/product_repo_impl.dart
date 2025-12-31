import 'package:crm_app/app/features/product/data/model/product_response.dart';
import 'package:crm_app/app/features/product/data/model/product_create.dart';

import '../../../common/data/repo/data_state.dart';

abstract class ProductRepoImpl {
  Future<DataState<ProductResponse>> createProduct({
    required ProductCreate body,
  });

  Future<DataState<dynamic>> deleteProduct({required int id});

  Future<DataState<List<ProductResponse>>> getAllProduct();

  Future<DataState<ProductResponse>> getProduct({required int id});

  Future<DataState<dynamic>> updateProduct({
    required int id,
    required ProductCreate body,
  });
}
