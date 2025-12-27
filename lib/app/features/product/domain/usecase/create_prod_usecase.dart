import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/product/data/model/product_response.dart';
import 'package:crm_app/app/features/product/data/model/product_write.dart';
import 'package:crm_app/app/features/product/domain/repo/product_repo_impl.dart';

class CreateProdUsecase {
  final ProductRepo _repo;

  CreateProdUsecase(this._repo);

  Future<DataState<ProductResponse>> call({required ProductCreate body}) async {
    return await _repo.createProduct(body: body);
  }
}
