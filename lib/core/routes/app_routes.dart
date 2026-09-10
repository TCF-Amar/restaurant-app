import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/core/routes/route_name.dart';
import 'package:project/features/home/presentation/screens/main_screen.dart';

class AppRoutes {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: RouteName.initial,
    routes: [
      GoRoute(
        path: RouteName.initial,
        name: 'initial',
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: RouteName.home,
        name: 'home',
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: RouteName.second,
        name: 'second',
        builder: (context, state) => const MainScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('No route defined for ${state.uri}'),
      ),
    ),
  );
}
