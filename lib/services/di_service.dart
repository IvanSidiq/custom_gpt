import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../app/routes.dart';

class DIService {
  static void initialize() {
    GetIt.I
        .registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
    GetIt.I.registerSingleton<GoRouter>(GoRouter(routes: configureRoutes()));
  }

  static void initializeConfig(OpenAI openAI) {
    GetIt.I.registerSingleton<OpenAI>(OpenAI.instance.build(
        token: "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",
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
        isLog: true));
  }
}
