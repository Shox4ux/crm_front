import 'package:dio/dio.dart';

String handleDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return 'Connection timeout';

    case DioExceptionType.sendTimeout:
      return 'Request timeout';

    case DioExceptionType.receiveTimeout:
      return 'Server took too long to respond';

    case DioExceptionType.badResponse:
      return _handleBadResponse(e);

    case DioExceptionType.connectionError:
      return 'No internet or server unreachable';

    case DioExceptionType.cancel:
      return 'Request was cancelled';

    case DioExceptionType.unknown:
    default:
      return 'Unexpected error occurred';
  }
}

String _handleBadResponse(DioException e) {
  final status = e.response?.statusCode;
  final data = e.response?.data;

  if (status == 422) {
    // FastAPI validation error
    if (data is Map && data['detail'] != null) {
      return data['detail'].toString();
    }
    return 'Invalid input data';
  }

  if (status == 401) return 'Unauthorized';
  if (status == 403) return 'Forbidden';
  if (status == 404) return 'Not found';
  if (status == 500) return 'Server error';

  return 'HTTP error ($status)';
}
