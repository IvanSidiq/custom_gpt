import 'package:dio/dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../models/base_response.dart';
import '../utils/customs/custom_toast.dart';

class ExceptionHelper<T> {
  final DioError e;
  ExceptionHelper(this.e);

  Future<BaseResponse<T>> catchException({bool activateToast = true}) async {
    String message = '';
    int statusCode = 0;

    await Sentry.captureException(e, stackTrace: e.stackTrace);

    switch (e.type) {
      case DioErrorType.connectionTimeout:
        message = "Connection Timeout";
        statusCode = 500;
        break;
      case DioErrorType.sendTimeout:
        message = "Connection Timeout";
        statusCode = 500;

        break;
      case DioErrorType.receiveTimeout:
        message = "Connection Timeout";
        statusCode = 500;

        break;
      case DioErrorType.badResponse:
        if (e.response == null) {
          return BaseResponse(
            message: "Can't reach to the http server",
            statusCode: 500,
          );
        }
        final eResponse = e.response!;
        final statusCode = e.response!.statusCode;

        if (eResponse.data['message'] != null) {
          message = eResponse.data['message'] ??
              "Something is wrong, please try again";
        } else {
          message = eResponse.toString();
        }

        return BaseResponse(
          message: message,
          statusCode: statusCode,
          data: eResponse.data,
        );
      case DioErrorType.cancel:
        message = "Something is wrong, please try again";
        statusCode = 500;

        break;
      case DioErrorType.badCertificate:
        message = "Something is wrong, certificate error";
        statusCode = 500;
        break;
      case DioErrorType.connectionError:
        message = "No Internet Connection";
        statusCode = 500;
        break;
      case DioErrorType.unknown:
        message = "Something is wrong, please try again";
        statusCode = 500;
        break;
    }

    activateToast ? CustomToast.showToastError(message) : {};
    // statusCode >= 500 ? CustomToast.showToastError(message) : {};
    return BaseResponse(
      message: message,
      statusCode: statusCode,
      data: e.response?.data['errors'],
    );
  }
}
