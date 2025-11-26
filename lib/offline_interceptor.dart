import 'package:crm_app/connectivity_service.dart';
import 'package:dio/dio.dart';

class OfflineInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!NetworkStatusService.instance.isOnline) {
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.unknown,
          error: 'NO_INTERNET',
        ),
      );
    }
    super.onRequest(options, handler);
  }
}
