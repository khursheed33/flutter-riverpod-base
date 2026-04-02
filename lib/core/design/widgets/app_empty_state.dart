import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_theme_context.dart';
import 'package:flutter_riverpod_base/core/design/app_tokens.dart';
import 'package:flutter_riverpod_base/core/design/widgets/app_button.dart';
import 'package:flutter_riverpod_base/features/presentation/widgets/app_title.dart';

/// Empty / error / offline panels with optional primary action.
class AppEmptyState extends StatelessWidget {
  const AppEmptyState({
    super.key,
    required this.title,
    this.message,
    this.icon,
    this.iconSize,
    this.actionLabel,
    this.onAction,
    this.isErrorStyle = false,
  });

  final String title;
  final String? message;
  final IconData? icon;
  final double? iconSize;
  final String? actionLabel;
  final VoidCallback? onAction;
  final bool isErrorStyle;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final dim = context.appDim;
    final resolvedIconSize = iconSize ?? dim.emptyStateIconSize;
    final accent = isErrorStyle ? cs.error : cs.primary;
    return Padding(
      padding: const EdgeInsets.all(AppSpace.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(icon, size: resolvedIconSize, color: accent.withValues(alpha: 0.85)),
          SizedBox(height: icon != null ? AppSpace.md : 0),
          AppTitle(
            title,
            textAlign: TextAlign.center,
            variant: AppTitleVariant.title,
            color: isErrorStyle ? cs.error : null,
          ),
          if (message != null) ...[
            const SizedBox(height: AppSpace.xs),
            AppTitle(
              message!,
              textAlign: TextAlign.center,
              variant: AppTitleVariant.body,
              color: cs.onSurfaceVariant,
            ),
          ],
          if (actionLabel != null && onAction != null) ...[
            const SizedBox(height: AppSpace.lg),
            AppButton(
              label: actionLabel!,
              onPressed: onAction,
              variant: AppButtonVariant.filled,
              expandWidth: false,
            ),
          ],
        ],
      ),
    );
  }
}
