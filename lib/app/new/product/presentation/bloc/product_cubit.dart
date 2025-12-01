// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:crm_app/app/new/common/data/repo/data_state.dart';
import 'package:crm_app/app/new/product/data/model/product_write.dart';
import 'package:meta/meta.dart';

import 'package:crm_app/app/new/product/domain/usecase/create_prod_usecase.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  CreateProdUsecase createProdUsecase;

  ProductCubit(this.createProdUsecase) : super(ProductInitial());

  void createProd(ProductWrite body) async {
    var res = await createProdUsecase(body: body);

    if (res is DataSuccess) {
    } else {}
  }
}
