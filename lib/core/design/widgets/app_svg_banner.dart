import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/constants/app_graphics.dart';
import 'package:flutter_svg/svg.dart';

/// Full-width SVG header for marketing / auth layouts.
class AppSvgBanner extends StatelessWidget {
  const AppSvgBanner({
    super.key,
    this.assetPath,
    this.heightFactor = 0.35,
    this.width,
    this.fit = BoxFit.cover,
  });

  final String? assetPath;
  final double heightFactor;
  final double? width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height * heightFactor;
    return SizedBox(
      height: h,
      width: width ?? MediaQuery.sizeOf(context).width,
      child: SvgPicture.asset(
        assetPath ?? AppGraphics.demo,
        fit: fit,
      ),
    );
  }
}
