import 'package:crm_app/app/features/common/data/repo/data_state.dart';
import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_bulk.dart';
import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_bulk_update.dart';
import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_write.dart';
import 'package:crm_app/app/src/data/remote/models/response/product/product_expense_read.dart';
import '../../../models/request/product/product_write.dart';
import '../../../models/response/del_read.dart';
import '../../../models/response/product/product_read.dart';

abstract class ProductRepoImpl {
  Future<DataState<ProductRead>> createProduct({required ProductWrite body});
  Future<DataState<DelRead>> deleteProduct({required int id});
  Future<DataState<List<ProductRead>>> getAllProduct();
  Future<DataState<ProductRead>> getProduct({required int id});
  Future<DataState<dynamic>> updateProduct({
    required int id,
    required ProductWrite body,
  });

  // =====================Prod Exps====================//

  Future<DataState<dynamic>> createProductExp({
    required ProductExpenseBulk body,
  });
  Future<DataState<ProductExpenseRead>> updateProductExp({
    required int id,
    required ProductExpenseWrite body,
  });

  Future<DataState<dynamic>> updateBulkProdExp({
    required ProdExpBulkUpdate body,
  });

  Future<DataState<DelRead>> deleteProductExp({required int id});
}



// class ProdBase(BaseModel):

//     name: str
//     buy_price: float
//     sell_price: float
//     img_url: Optional[str]


// class ProductWrite(ProdBase):
//     pass


// class ProductRead(ProdBase):
//     id: int
//     created_at: datetime

//     class Config:
//         from_attributes = True
