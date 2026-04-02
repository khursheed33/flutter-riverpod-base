import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/widgets/app_svg_banner.dart';

@Deprecated('Use AppSvgBanner')
class AppHeaderWithImage extends StatelessWidget {
  const AppHeaderWithImage({
    super.key,
    this.assetName,
    this.height,
    this.width,
    this.boxFit,
  });

  final String? assetName;
  final double? height;
  final double? width;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    final f = height != null
        ? (height! / MediaQuery.sizeOf(context).height).clamp(0.05, 0.95)
        : 0.35;
    return AppSvgBanner(
      assetPath: assetName,
      heightFactor: f,
      width: width,
      fit: boxFit ?? BoxFit.cover,
    );
  }
}
