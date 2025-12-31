import 'package:crm_app/app/features/client/data/model/client_prod_update.dart';
import 'package:crm_app/app/features/client/data/model/client_response.dart';
import 'package:crm_app/app/utils/conts/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'client_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class ClientApiService {
  factory ClientApiService(Dio dio, {String baseUrl}) = _ClientApiService;

  //=========================== CLIENT Endpoints ======================//

  @POST('/clients/create')
  Future<HttpResponse<dynamic>> createClient({
    @Part() MultipartFile? img,
    @Part() required String username,
    @Part() required String password,
    @Part() required String address,
    @Part() required String phone,
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
    @Part() MultipartFile? img,
    @Part() required String? username,
    @Part() required String? password,
    @Part() required String? address,
    @Part() required String? phone,
    @Part(name: "is_active") required bool? isActive,
  });

  @PATCH('/clients/update_client_product/{cp_id}')
  Future<HttpResponse<dynamic>> updateClientProd({
    @Path("cp_id") required int cpId,
    @Body() required ClientProdUpdate body,
  });
}
