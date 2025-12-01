import 'package:crm_app/app/new/common/data/repo/data_state.dart';
import 'package:crm_app/app/new/product/data/model/product_read.dart';
import 'package:crm_app/app/new/product/domain/repo/product_repo_impl.dart';

class GetAllProdUsecase {
  final ProductRepo _repo;
  GetAllProdUsecase(this._repo);

  Future<DataState<List<ProductRead>>> call() async {
    return await _repo.getAllProduct();
  }
}
