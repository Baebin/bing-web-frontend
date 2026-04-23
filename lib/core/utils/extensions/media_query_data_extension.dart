import 'package:bing_web_frontend/core/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

extension MediaQueryExtension on MediaQueryData {
  bool get isMobile => size.isMobile;
  bool get isDesktop => size.isDesktop;
  bool get isTablet => size.isTablet;
}