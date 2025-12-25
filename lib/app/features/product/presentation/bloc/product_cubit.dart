import 'package:bloc/bloc.dart';
import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/features/product/data/model/product_write.dart';
import 'package:crm_app/app/features/product/domain/entity/product_entity.dart';
import 'package:crm_app/app/features/product/domain/repo/product_repo_impl.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo _repo;
  ProductCubit(this._repo)
    : super(ProductState(status: ProdStatus.init, msg: null));

  void createProd(ProductWrite body) async {
    var res = await _repo.createProduct(body: body);

    if (res is DataSuccess) {
      emit(state.copyWith(status: ProdStatus.success));
    } else {
      emit(
        state.copyWith(
          status: ProdStatus.error,
          msg: (res as DataFailed).errorMsg,
        ),
      );
    }
  }
}
