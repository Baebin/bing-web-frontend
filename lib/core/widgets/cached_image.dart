import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String url;

  final double? width;
  final double? height;
  final BoxFit fit;

  final bool isCircle;

  // Solid Border
  final bool hasSolidBorder;

  // Dotted Border
  final bool hasDottedBorder;
  final List<double> dashPattern;

  // Border Options
  final double borderWidth;
  final Color borderColor;

  const CachedImage({
    super.key,

    required this.url,

    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.isCircle = false,

    this.hasSolidBorder = false,

    this.hasDottedBorder = false,
    this.dashPattern = const [6, 3],

    this.borderColor = Colors.black,
    this.borderWidth = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    Widget widget;
    if (url.startsWith("assets/")) {
      widget = Image.asset(
        url,
        width: width,
        height: height,
        fit: fit,
      );
    }
    else {
      widget = CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) =>
        const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    }
    if (isCircle) widget = ClipOval(child: widget);
    if (hasSolidBorder) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircle ? null : BorderRadius.circular(15),
          border: Border.all(color: borderColor, width: borderWidth)
        ),
        child: isCircle ? widget : ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: widget,
        ),
      );
    }
    if (hasDottedBorder) {
      return DottedBorder(
        options: CircularDottedBorderOptions(
          color: borderColor,
          strokeWidth: borderWidth,
          dashPattern: dashPattern,
          padding: const EdgeInsets.all(4),
        ),
        child: widget,
      );
    }
    return widget;
  }
}
