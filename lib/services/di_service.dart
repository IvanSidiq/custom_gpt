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

  static void initializeConfig(Dio dio) {
    GetIt.I.registerSingleton<Dio>(dio);
  }
}
