import 'package:flutter/widgets.dart';

extension BoxConstraintsExtension on BoxConstraints {
  bool get isMobile => maxWidth < 600;
  bool get isDesktop => maxWidth > 1024;
  bool get isTablet => (600 <= maxWidth && maxWidth <= 1024);
}