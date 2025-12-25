import 'package:crm_app/app/features/product_expense/data/model/expense_bulk_create.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_bulk_update.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_create.dart';
import 'package:crm_app/app/features/product_expense/data/model/expense_response.dart';
import 'package:crm_app/app/utils/conts/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'expense_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class ExpenseApiService {
  factory ExpenseApiService(Dio dio, {String baseUrl}) = _ExpenseApiService;
  //=========================== Product Expense Endpoints ======================//

  @POST('/product_expense/create')
  Future<HttpResponse> createProductExp({
    @Body() required ProductExpenseBulkCreate body,
  });

  @PATCH('/product_expense/update_bulk')
  Future<HttpResponse> updateBulkProductExp({
    @Body() required ExpenseBulkUpdate body,
  });

  @DELETE('/product_expense/update/{id}')
  Future<HttpResponse<ProductExpenseResponse>> updateProductExp({
    @Path("id") required int id,
    @Body() required ProductExpenseCreate body,
  });

  @DELETE('/product_expense/delete/{id}')
  Future<HttpResponse> deleteProductExp({@Path("id") required int id});
}
