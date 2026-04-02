import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/widgets/app_surface.dart';

@Deprecated('Use AppSurface')
class AppContainerWithBG extends StatelessWidget {
  const AppContainerWithBG({
    super.key,
    required this.child,
    this.color,
    this.width,
    this.maxWidth,
    this.radius,
    this.maxHeight,
    this.borderColor,
    this.borderWidth,
    this.marginVertical,
    this.marginHorizontal,
    this.boxShadow,
    this.padding,
    this.margin,
  });

  final Widget child;
  final Color? color;
  final double? width;
  final double? maxWidth;
  final double? radius;
  final double? maxHeight;
  final Color? borderColor;
  final double? borderWidth;
  final double? marginVertical;
  final double? marginHorizontal;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return AppSurface(
      width: width ?? MediaQuery.sizeOf(context).width,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      radius: radius,
      color: color,
      padding: padding,
      margin: margin ??
          EdgeInsets.symmetric(
            vertical: marginVertical ?? 0,
            horizontal: marginHorizontal ?? 0,
          ),
      borderColor: borderColor,
      borderWidth: borderWidth ?? 0,
      shadows: boxShadow,
      child: child,
    );
  }
}
