import 'package:crm_app/app/features/warehouse/data/model/warehouse_create.dart';
import 'package:crm_app/app/features/warehouse/data/model/warehouse_response.dart';
import 'package:crm_app/app/utils/conts/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'warehouse_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class WarehouseApiService {
  //=========================== Warehouse Endpoints ======================//
  factory WarehouseApiService(Dio dio, {String baseUrl}) = _WarehouseApiService;

  @POST('/warehouses/create')
  Future<HttpResponse<WarehouseResponse>> createWarehouse({
    @Body() required WarehouseCreate body,
  });

  @PATCH('/warehouses/update/{id}')
  Future<HttpResponse<WarehouseResponse>> updateWarehouse({
    @Path("id") required int id,
    @Body() required WarehouseCreate body,
  });

  @GET('/warehouses/get_by_id/{id}')
  Future<HttpResponse<WarehouseResponse>> getWarehouseById({
    @Path("id") required int id,
  });

  @GET('/warehouses/get_all')
  Future<HttpResponse<List<WarehouseResponse>>> getAllWarehouse();

  @DELETE('/warehouses/delete/{id}')
  Future<HttpResponse> deleteWarehouse({@Path("id") required int id});
}
