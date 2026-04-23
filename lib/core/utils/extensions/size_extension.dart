import 'package:flutter/material.dart';

extension SizeExtension on Size {
  bool get isMobile => width < 600;
  bool get isDesktop => width > 1024;
  bool get isTablet => (600 <= width && width <= 1024);
}