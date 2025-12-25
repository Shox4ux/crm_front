import 'package:crm_app/app/features/order/data/model/order_response.dart';
import 'package:crm_app/app/features/order_product/data/model/order_pro_bulk_create.dart';
import 'package:crm_app/app/features/order_product/data/model/order_pro_update.dart';
import 'package:crm_app/app/utils/conts/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'order_pro_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class OrderProApiService {
  factory OrderProApiService(Dio dio, {String baseUrl}) = _OrderProApiService;
  //=========================== Order Products Endpoints ======================//

  @POST('/order_products/create')
  Future<HttpResponse<dynamic>> createOrderProd({
    @Body() required OrderProBulkCreate body,
  });

  @GET('/order_products/get_by_id/{id}')
  Future<HttpResponse<OrderResponse>> getOrderProdById({
    @Path("id") required int id,
  });

  @GET('/order_products/get_all')
  Future<HttpResponse<List<OrderResponse>>> getAllOrderProd();

  @DELETE('/order_products/delete/{id}')
  Future<HttpResponse<dynamic>> deleteOrderProd({@Path("id") required int id});

  @PATCH('/order_products/update/{id}')
  Future<HttpResponse<dynamic>> updateOrderProd({
    @Path("id") required int id,
    @Body() required OrderProUpdate body,
  });
}
