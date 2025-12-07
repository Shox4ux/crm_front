import 'package:crm_app/app/new/client/data/model/client_create.dart';
import 'package:crm_app/app/new/client/data/model/client_prod_update.dart';
import 'package:crm_app/app/new/client/data/model/client_response.dart';
import 'package:crm_app/app/new/client/data/model/client_update.dart';
import 'package:crm_app/app/utils/conts/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'client_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl, parser: Parser.MapSerializable)
abstract class ClientApiService {
  factory ClientApiService(Dio dio, {String baseUrl}) = _ClientApiService;

  //=========================== CLIENT Endpoints ======================//

  @POST('/clients/create')
  Future<HttpResponse<dynamic>> createClient({
    @Body() required ClientCreate body,
  });

  @GET('/clients/get_by_user_id/{user_id}')
  Future<HttpResponse<ClientResponse>> getClientById({
    @Path("user_id") required int userId,
  });

  @GET('/clients/get_all')
  Future<HttpResponse<List<ClientResponse>>> getAllClient();

  @DELETE('/clients/delete/{id}')
  Future<HttpResponse<dynamic>> deleteClient({@Path("id") required int id});

  @PATCH('/clients/update/{id}')
  Future<HttpResponse<dynamic>> updateClient({
    @Path("id") required int id,
    @Body() required ClientUpdate body,
  });

  @PATCH('/clients/update_client_product/{cp_id}')
  Future<HttpResponse<dynamic>> updateClientProd({
    @Path("cp_id") required int cpId,
    @Body() required ClientProdUpdate body,
  });
}
