class BaseResponse<T> {
  final int? statusCode;
  final dynamic message;
  final T? data;

  BaseResponse({
    this.message,
    this.data,
    this.statusCode,
  });
}
