import 'package:crm_app/app/features/order_cancel/data/model/order_cancel_create.dart';
import 'package:crm_app/app/utils/conts/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'order_cancel_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class OrderCancelApiService {
  factory OrderCancelApiService(Dio dio, {String baseUrl}) =
      _OrderCancelApiService;

  @POST('/order_cancels/create')
  Future<HttpResponse<dynamic>> cancelOrder({
    @Body() required OrderCancelCreate body,
  });

  // @GET('/order_cancel/get_by_id/{id}')
  // Future<HttpResponse<OrderResponse>> getOrderProdById({
  //   @Path("id") required int id,
  // });

  // @GET('/order_cancel/get_all')
  // Future<HttpResponse<List<OrderResponse>>> getAllOrderProd();

  // @DELETE('/order_cancel/delete/{id}')
  // Future<HttpResponse<dynamic>> deleteOrderProd({@Path("id") required int id});

  // @PATCH('/order_cancel/update/{id}')
  // Future<HttpResponse<dynamic>> updateOrderProd({
  //   @Path("id") required int id,
  //   @Body() required OrderProUpdate body,
  // });
}
