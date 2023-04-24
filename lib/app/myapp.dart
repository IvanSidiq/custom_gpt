import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../services/di_service.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final ColorScheme _lightScheme = ColorScheme.fromSeed(
      seedColor: Color.fromARGB(255, 56, 64, 85), brightness: Brightness.light);
  final ColorScheme _darkScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFFB4C5FF), brightness: Brightness.dark);

  @override
  void initState() {
    super.initState();
    DIService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    final route = GetIt.I<GoRouter>();
    return ScreenUtilInit(
      designSize: const Size(390, 870),
      builder: (context, widget) => MaterialApp.router(
        routerConfig: route,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          colorScheme: _lightScheme,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Inter',
        ),
        darkTheme: ThemeData(
          colorScheme: _darkScheme,
          scaffoldBackgroundColor: Colors.black,
          fontFamily: 'Inter',
        ),
      ),
    );
  }
}
