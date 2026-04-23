import 'package:flutter/material.dart';

extension MediaQueryExtension on MediaQueryData {
  bool get isMobile => size.width < 600;
  bool get isDesktop => size.width > 1024;
  bool get isTablet => (600 <= size.width && size.width <= 1024);
}