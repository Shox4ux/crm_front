import 'package:crm_app/app/features/admin/data/model/admin_response.dart';
import 'package:crm_app/app/utils/conts/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'admin_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class AdminApiService {
  factory AdminApiService(Dio dio, {String baseUrl}) = _AdminApiService;

  @GET('/admins/get_by_user_id/{user_id}')
  Future<HttpResponse<AdminResponse>> getAdminByUserId({
    @Path("user_id") required int userId,
  });
}
