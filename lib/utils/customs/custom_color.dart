import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class CustomColor {
  static Color primary = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .primary;
  static Color onPrimary = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .onPrimary;
  static Color primaryContainer = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .primaryContainer;
  static Color onPrimaryContainer = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .onPrimaryContainer;

  static Color secondary = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .secondary;
  static Color onSecondary = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .onSecondary;
  static Color secondaryContainer = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .secondaryContainer;
  static Color onSecondaryContainer = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .onSecondaryContainer;

  static Color tertiary = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .tertiary;
  static Color onTertiary = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .onTertiary;
  static Color tertiaryContainer = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .tertiaryContainer;
  static Color onTertiaryContainer = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .onTertiaryContainer;

  static Color error = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .error;
  static Color onError = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .onError;
  static Color errorContainer = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .errorContainer;
  static Color onErrorContainer = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .onErrorContainer;

  static Color background = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .background;
  static Color onBackground = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .onBackground;

  static Color surface = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .surface;
  static Color onSurface = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .onSurface;
  static Color surfaceVariant = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .surfaceVariant;
  static Color onSurfaceVariant = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .onSurfaceVariant;

  static Color outline = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .outline;

  static Color inverseOnSurface = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .onInverseSurface;
  static Color inverseSurface = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .inverseSurface;
  static Color inversePrimary = Theme.of(
          GetIt.I<GoRouter>().routerDelegate.navigatorKey.currentState!.context)
      .colorScheme
      .inversePrimary;

  static Color surface1 = primary.withOpacity(0.05);
  static Color surface2 = primary.withOpacity(0.08);
  static Color surface3 = primary.withOpacity(0.11);
  static Color surface4 = primary.withOpacity(0.12);
  static Color surface5 = primary.withOpacity(0.14);

  static Color shimmerBase = const Color(0xFFEEEEEE);
  static Color shimmerLight = const Color(0xFFEEEEEE).withOpacity(0.05);

  static Color neutral90 = const Color(0xFFE3E1E6);
}
