import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_tokens.dart';
import 'package:flutter_riverpod_base/features/presentation/widgets/app_title.dart';

/// Row: title + expanding divider — lists and forms.
class AppSectionHeader extends StatelessWidget {
  const AppSectionHeader({
    super.key,
    required this.title,
    this.leadingPadding = AppSpace.sm,
    this.trailing,
    this.showDivider = true,
  });

  final String title;
  final double leadingPadding;
  final Widget? trailing;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSpace.xs),
      child: Row(
        children: [
          SizedBox(width: leadingPadding),
          AppTitle(title, variant: AppTitleVariant.title),
          const SizedBox(width: AppSpace.sm),
          if (showDivider) const Expanded(child: Divider(height: 1)),
          if (trailing != null) ...[
            const SizedBox(width: AppSpace.sm),
            trailing!,
          ],
        ],
      ),
    );
  }
}
