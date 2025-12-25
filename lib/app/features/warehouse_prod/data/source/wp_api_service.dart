import 'package:crm_app/app/features/warehouse_prod/data/model/ware_pro_create.dart';
import 'package:crm_app/app/features/warehouse_prod/data/model/ware_pro_response.dart';
import 'package:crm_app/app/utils/conts/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'wp_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class WPApiService {
  factory WPApiService(Dio dio, {String baseUrl}) = _WPApiService;

  //=========================== WarehouseProducts Endpoints ======================//

  @POST('/warehouse_products/create')
  Future<HttpResponse> createWProduct({@Body() required WareProCreate body});

  @GET('/warehouse_products/get_by_id/{id}')
  Future<HttpResponse<WareProResponse>> getWProductById({
    @Path("id") required int id,
  });

  @GET('/warehouse_products/get_all')
  Future<HttpResponse<List<WareProResponse>>> getAllWProduct();

  @GET('/warehouse_products/get_all/{ware_id}')
  Future<HttpResponse<List<WareProResponse>>> getAllWProductByWareId({
    @Path("ware_id") required int wareId,
  });

  @DELETE('/warehouse_products/delete/{id}')
  Future<HttpResponse> deleteWProduct({@Path("id") required int id});
}
