import 'package:crm_app/app/new/common/data/repo/data_state.dart';
import 'package:crm_app/app/new/product/data/model/product_write.dart';
import 'package:crm_app/app/new/product/domain/repo/product_repo_impl.dart';

class UpdateProdUsecase {
  final ProductRepo _repo;
  UpdateProdUsecase(this._repo);

  Future<DataState> call({required int id, required ProductWrite body}) async {
    return await _repo.updateProduct(id: id, body: body);
  }
}
