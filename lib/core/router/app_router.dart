import 'package:bing_web_frontend/core/router/app_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: AppRoute.routes.entries.map((entry) {
      return GoRoute(
        path: entry.key,
        builder: (BuildContext context, GoRouterState state) => entry.value(context),
      );
    }).toList()
  );
}