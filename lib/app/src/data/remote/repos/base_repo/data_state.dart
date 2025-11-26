abstract class DataState<T> {
  final T? data;
  final String? errorMsg;
  final int? code;

  const DataState({this.data, this.errorMsg, this.code});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(String errorMsg, {int? code})
    : super(errorMsg: errorMsg, code: code);
}
