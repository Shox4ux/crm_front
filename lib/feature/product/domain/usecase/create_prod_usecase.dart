import 'package:crm_app/common/data_state.dart';
import 'package:crm_app/feature/product/data/model/product_read.dart';
import 'package:crm_app/feature/product/data/model/product_write.dart';
import 'package:crm_app/feature/product/domain/repo/product_repo_impl.dart';

class CreateProdUsecase {
  final ProductRepo _repo;

  CreateProdUsecase(this._repo);

  Future<DataState<ProductRead>> call({required ProductWrite body}) async {
    return await _repo.createProduct(body: body);
  }
}
