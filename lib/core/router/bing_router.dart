import 'package:bing_web_frontend/core/router/bing_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class BingRouter {
  static final GoRouter router = GoRouter(
      navigatorKey: navigatorKey,
      routes: BingRoute.routes.entries.map((entry) {
        return GoRoute(
            path: entry.key,
            parentNavigatorKey: navigatorKey,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: entry.value(context),
                transitionDuration: const Duration(milliseconds: 350),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  // 위로 살짝 떠오르는 애니메이션
                  final slideAnimation = Tween<Offset>(
                    begin: const Offset(0, 0.05),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                  ));

                  // 투명도 애니메이션
                  final fadeAnimation = CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeIn,
                  );

                  return SlideTransition(
                    position: slideAnimation,
                    child: FadeTransition(
                      opacity: fadeAnimation,
                      child: child,
                    ),
                  );
                },
              );
            }
        );
      }).toList()
  );
}