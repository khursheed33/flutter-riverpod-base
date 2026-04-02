import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/widgets/app_hero_icon_header.dart';

@Deprecated('Use AppHeroIconHeader')
class AppScreenHeader extends StatelessWidget {
  const AppScreenHeader({super.key, this.paddingTop, required this.icon});

  final IconData icon;
  final double? paddingTop;

  @override
  Widget build(BuildContext context) {
    return AppHeroIconHeader(icon: icon, paddingTop: paddingTop ?? 0);
  }
}
