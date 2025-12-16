import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_bulk.dart';
import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_write.dart';
import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_bulk_update.dart';
import 'package:crm_app/app/src/data/remote/models/response/product/product_expense_read.dart';

import 'package:crm_app/app/utils/conts/api_urls.dart';
import 'package:crm_app/app/features/product/data/model/product_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'product_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl, parser: Parser.MapSerializable)
abstract class ProductApiService {
  factory ProductApiService(Dio dio, {String baseUrl}) = _ProductApiService;

  //=========================== PRODUCT Endpoints ======================//

  @POST('/products/create')
  @MultiPart()
  Future<HttpResponse<ProductResponse>> createProduct({
    @Part() MultipartFile? img,
    @Part() required String name,
    @Part(name: "base_price") required double basePrice,
    @Part(name: "sell_price") required double sellPrice,
    @Part(name: "measure") required int measure,
    @Part(name: "total_quantity") required int totalQuantity,
    @Part(name: "active_quantity") required int activeQuantity,
  });

  @GET('/products/get_by_id/{id}')
  Future<HttpResponse<ProductResponse>> getProductById({
    @Path("id") required int id,
  });

  @GET('/products/get_all')
  Future<HttpResponse<List<ProductResponse>>> getAllProduct();

  @PATCH('/products/update/{id}')
  Future<HttpResponse<dynamic>> updateProduct({
    @Path("id") required int id,
    @Part(name: "img") MultipartFile? img,
    @Part(name: "name") String? name,
    @Part(name: "base_price") double? basePrice,
    @Part(name: "sell_price") double? sellPrice,
    @Part(name: "total_quantity") int? totalQuantity,
    @Part(name: "active_quantity") int? activeQuantity,
  });

  @DELETE('/products/delete/{id}')
  Future<HttpResponse<dynamic>> deleteProduct({@Path("id") required int id});

  //=========================== Product Expense Endpoints ======================//

  @POST('/product_expense/create')
  Future<HttpResponse<dynamic>> createProductExp({
    @Body() required ProductExpenseBulk body,
  });

  @PATCH('/product_expense/update_bulk')
  Future<HttpResponse<dynamic>> updateBulkProductExp({
    @Body() required ProdExpBulkUpdate body,
  });

  @DELETE('/product_expense/update/{id}')
  Future<HttpResponse<ProductExpenseRead>> updateProductExp({
    @Path("id") required int id,
    @Body() required ProductExpenseWrite body,
  });

  @DELETE('/product_expense/delete/{id}')
  Future<HttpResponse<dynamic>> deleteProductExp({@Path("id") required int id});
}
