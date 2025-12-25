import 'package:crm_app/app/features/order/data/model/order_create.dart';
import 'package:crm_app/app/features/order/data/model/order_response.dart';
import 'package:crm_app/app/utils/conts/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'order_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class OrderApiService {
  factory OrderApiService(Dio dio, {String baseUrl}) = _OrderApiService;

  //=========================== ORDER Endpoints ======================//

  @POST('/orders/create')
  Future<HttpResponse<OrderResponse>> createOrder({
    @Body() required OrderCreate body,
  });

  @GET('/orders/get_by_id/{id}')
  Future<HttpResponse<OrderResponse>> getOrderById({
    @Path("id") required int id,
  });

  @GET('/orders/get_all')
  Future<HttpResponse<List<OrderResponse>>> getAllOrder();

  @PATCH('/orders/update/{id}')
  Future<HttpResponse> updateOrder({
    @Path("id") required int id,
    @Body() required OrderCreate body,
  });

  @DELETE('/orders/delete/{id}')
  Future<HttpResponse> deleteOrder({@Path("id") required int id});
}
