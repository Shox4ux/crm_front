import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/product/data/model/product_response.dart';
import 'package:crm_app/app/features/product/domain/repo/product_repo_impl.dart';

class GetAllProdUsecase {
  final ProductRepo _repo;
  GetAllProdUsecase(this._repo);

  Future<DataState<List<ProductResponse>>> call() async {
    return await _repo.getAllProduct();
  }
}
