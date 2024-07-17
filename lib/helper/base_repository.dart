import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:retry/retry.dart';

import '../models/base_response.dart';
import 'exception_helper.dart';

class BaseRepository {
  final Dio dio = GetIt.I<Dio>();

  Future<BaseResponse> fetch(String api,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      bool activateToast = true}) async {
    try {
      final response = await retry(
        () => dio.get(
          api,
          queryParameters: queryParameters,
          options: Options(
            responseType: ResponseType.json,
            headers: headers,
          ),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      return BaseResponse(
        statusCode: response.statusCode,
        data: response.data,
      );
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException(activateToast: activateToast);
    }
  }

  Future<BaseResponse> post(
    String api, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    ResponseType responseType = ResponseType.json,
  }) async {
    try {
      final response = await retry(
        () {
          return dio.post(
            api,
            data: json.encode(data),
            options: Options(
              responseType: responseType,
              headers: headers,
            ),
          );
        },
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      return BaseResponse(
        statusCode: response.statusCode,
        data: response.data,
      );
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }
}
