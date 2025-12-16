import 'package:crm_app/app/features/user/data/model/login_request.dart';
import 'package:crm_app/app/features/user/data/model/login_response.dart';
import 'package:crm_app/app/features/user/data/model/user_response.dart';
import 'package:crm_app/app/utils/conts/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl, parser: Parser.MapSerializable)
abstract class UserApiService {
  factory UserApiService(Dio dio, {String baseUrl}) = _UserApiService;

  //=========================== AUTH Endpoints ======================//

  @POST('/auth/login')
  Future<HttpResponse<LoginResponse>> loginUser({
    @Body() required LoginRequest body,
  });

  @POST('/auth/verify_user')
  Future<HttpResponse<UserResponse>> verifyUser({
    @Query("token") required String token,
  });
}
