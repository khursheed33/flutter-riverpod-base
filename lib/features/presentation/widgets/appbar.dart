import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/widgets/app_navigation_bar.dart';

export 'package:flutter_riverpod_base/core/design/widgets/app_navigation_bar.dart';

@Deprecated('Use appNavigationAppBar')
PreferredSizeWidget customAppBar(
  BuildContext context, {
  String? title,
  bool? isCenter,
  Color? iconColor,
  Color? textColor,
  List<Widget>? actions,
}) {
  return appNavigationAppBar(
    context,
    title: title,
    centerTitle: isCenter ?? true,
    actions: actions,
  );
}
