import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/widgets/app_section_header.dart';

@Deprecated('Use AppSectionHeader')
class MMContentTitleWitDivider extends StatelessWidget {
  const MMContentTitleWitDivider({
    super.key,
    required this.title,
    this.leftPadding,
  });

  final String title;
  final double? leftPadding;

  @override
  Widget build(BuildContext context) {
    return AppSectionHeader(
      title: title,
      leadingPadding: leftPadding ?? 10,
    );
  }
}
