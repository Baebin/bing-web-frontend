import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExtension on BuildContext {
  void pushSafe(String location) {
    final String currentLocation = GoRouterState.of(this).uri.toString();
    if (currentLocation != location) push(location);
  }
}