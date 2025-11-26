//   Future<DataState<List<ProductRead>>> getAllProduct();

//   Future<DataState<ProductRead>> getProduct({required int id});

import 'package:crm_app/app/new/common/data_state.dart';
import 'package:crm_app/app/new/product/domain/repo/product_repo_impl.dart';

class DeleteProdUsecase {
  final ProductRepo _repo;
  DeleteProdUsecase(this._repo);

  Future<DataState> call({required int id}) async {
    return await _repo.deleteProduct(id: id);
  }
}
