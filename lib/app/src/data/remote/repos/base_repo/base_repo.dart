import 'dart:io' show HttpStatus;

import 'data_state.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:retrofit/retrofit.dart';

abstract class BaseRepo {
  /// This method is responsible of handling the given `request`, in which
  /// it returns generic based `DataState`.
  ///
  /// Returns `DataSuccess` that holds the generic data `T` if the response
  /// is successfully recieved.
  ///
  /// Returns `DataFailed` that holds a `DioError` instance if any error occurs
  /// while sending the request or recieving the response.
  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final httpResponse = await request();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        throw DioException(
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        );
      }
    } on DioException catch (e) {
      String errorMessage = "Unknown error";
      int code = 0;

      if (e.response != null && e.response?.data != null) {
        // If backend sends a JSON like {"message": "something went wrong"}
        if (e.response?.data is Map<String, dynamic>) {
          errorMessage = e.response?.data['message'] ?? 'Server error';
        } else {
          errorMessage = e.response?.data.toString() ?? "";
        }
      } else if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = "Connection timed out";
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = "Response timeout";
      } else if (e.type == DioExceptionType.unknown) {
        errorMessage = "No internet connection";
        code = 101;
      }

      print("API error: $errorMessage");
      return DataFailed(errorMessage, code: code);
    }
  }
}
