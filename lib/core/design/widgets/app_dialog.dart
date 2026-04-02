import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/constants/app_text.dart';
import 'package:flutter_riverpod_base/core/design/app_theme_context.dart';
import 'package:flutter_riverpod_base/core/design/app_tokens.dart';
import 'package:flutter_riverpod_base/features/presentation/widgets/app_title.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Themed [AlertDialog] helpers.
abstract final class AppDialog {
  static Future<bool?> confirm(
    BuildContext context, {
    required String title,
    String? message,
    String confirmLabel = AppText.confirm,
    String? cancelLabel,
    IconData icon = FontAwesomeIcons.triangleExclamation,
    bool barrierDismissible = false,
    bool isError = false,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (ctx) {
        final cs = Theme.of(ctx).colorScheme;
        final dim = ctx.appDim;
        return AlertDialog(
          icon: Icon(icon, size: dim.dialogIconSize, color: isError ? cs.error : cs.primary),
          title: AppTitle(title, textAlign: TextAlign.center, variant: AppTitleVariant.title),
          content: message != null
              ? Text(
                  message,
                  textAlign: TextAlign.center,
                  style: ctx.appTextOverrides.dialogBody,
                )
              : null,
          actionsPadding: const EdgeInsets.all(AppSpace.md),
          actions: [
            if (cancelLabel != null)
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: Text(cancelLabel),
              ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(confirmLabel),
            ),
          ],
        );
      },
    );
  }
}
