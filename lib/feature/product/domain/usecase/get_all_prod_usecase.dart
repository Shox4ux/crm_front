import 'package:crm_app/common/data_state.dart';
import 'package:crm_app/feature/product/data/model/product_read.dart';
import 'package:crm_app/feature/product/domain/repo/product_repo_impl.dart';

class GetAllProdUsecase {
  final ProductRepo _repo;
  GetAllProdUsecase(this._repo);

  Future<DataState<List<ProductRead>>> call() async {
    return await _repo.getAllProduct();
  }
}
