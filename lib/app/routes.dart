import 'package:go_router/go_router.dart';
import 'package:gpt/modules/home_screen.dart';

import '../modules/splash_screen.dart';

List<RouteBase> configureRoutes() {
  List<RouteBase> router = [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    // GoRoute(
    //     path: '/root',
    //     name: 'root',
    //     builder: (context, state) {
    //       return BottomNavigatorPage(
    //         initPage: int.tryParse(state.queryParams['initPage'] ?? '') ?? 0,
    //       );
    //     },
    //     routes: [
    //       GoRoute(
    //           path: 'attendance',
    //           name: 'attendance',
    //           builder: (context, state) {
    //             return const AttendanceReportScreen();
    //           },
    //           routes: [
    //             GoRoute(
    //               path: 'monthly',
    //               name: 'monthly',
    //               builder: (context, state) {
    //                 return MonthlyAttendanceReportScreen(
    //                   timersCheckin: state.queryParams['timersCheckin'] ?? '',
    //                 );
    //               },
    //             )
    //           ]),
    //       GoRoute(
    //           path: 'library',
    //           name: 'library',
    //           builder: (context, state) {
    //             return const LibraryScreen();
    //           },
    //           routes: [
    //             GoRoute(
    //               path: 'book',
    //               name: 'book',
    //               builder: (context, state) {
    //                 return BookDetailScreen(
    //                   bookId: state.queryParams['bookId'] ?? '',
    //                 );
    //               },
    //             )
    //           ]),
    //       GoRoute(
    //           path: 'profile',
    //           name: 'profile',
    //           builder: (context, state) {
    //             return const ProfileScreen();
    //           },
    //           routes: [
    //             GoRoute(
    //               path: 'name_setting',
    //               name: 'name_setting',
    //               builder: (context, state) {
    //                 return NameSetting(
    //                   name: state.queryParams['name'] ?? '',
    //                 );
    //               },
    //             ),
    //             GoRoute(
    //               path: 'password_setting',
    //               name: 'password_setting',
    //               builder: (context, state) {
    //                 return const PasswordSetting();
    //               },
    //             )
    //           ]),
    //     ]),
  ];
  return router;
}
