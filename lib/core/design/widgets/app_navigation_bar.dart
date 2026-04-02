import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_theme_context.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Standard back [AppBar] using theme [AppBarTheme].
PreferredSizeWidget appNavigationAppBar(
  BuildContext context, {
  String? title,
  bool centerTitle = true,
  List<Widget>? actions,
  VoidCallback? onBack,
}) {
  return AppBar(
    title: title == null ? null : Text(title),
    centerTitle: centerTitle,
    actions: actions,
    leading: IconButton(
      icon: Icon(FontAwesomeIcons.arrowLeft, size: context.appDim.iconSm),
      onPressed: onBack ?? () => Navigator.maybeOf(context)?.pop(),
    ),
  );
}
