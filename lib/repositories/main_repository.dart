import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../services/di_service.dart';

class MainRepository {
  MainRepository() {
    _init();
  }

  _init() async {
    await setConfig();
    GetIt.I<GoRouter>()
        .routerDelegate
        .navigatorKey
        .currentState!
        .context
        .goNamed('home');
  }

  Future<void> setConfig() async {
    Dio dio = await _setupDio();
    DIService.initializeConfig(dio);
  }

  Future<Dio> _setupDio() async {
    BaseOptions options = BaseOptions(
        baseUrl: "https://api.openai.com/v1/",
        connectTimeout: const Duration(milliseconds: 30000),
        receiveTimeout: const Duration(milliseconds: 30000),
        sendTimeout: const Duration(milliseconds: 30000),
        headers: {
          'accept': 'application/json',
          'X-Localization': 'id',
          'Authorization': 'Bearer ${dotenv.env['OPENAI_API_KEY']}',
          // -- only use if u have multiple organization --
          // 'OpenAI-Organization': '${dotenv.env['OPENAI_API_ORGANIZATION_KEY']}',
        });

    Dio dio = Dio(options);

    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.interceptors.add(LogInterceptor(
      responseBody: false,
      error: true,
      request: true,
      requestBody: true,
    ));

    return dio;
  }
}
