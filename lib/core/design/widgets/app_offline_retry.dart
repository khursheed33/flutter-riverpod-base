import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_tokens.dart';
import 'package:flutter_riverpod_base/core/design/widgets/app_button.dart';
import 'package:flutter_riverpod_base/core/errors/error_message.dart';
import 'package:flutter_riverpod_base/features/presentation/widgets/app_title.dart';

class AppOfflineRetry extends StatelessWidget {
  const AppOfflineRetry({super.key, this.onRetry});

  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTitle(
          ErrorMessage.noInternetConnection,
          textAlign: TextAlign.center,
          variant: AppTitleVariant.title,
        ),
        if (onRetry != null) ...[
          const SizedBox(height: AppSpace.md),
          AppButton(
            label: ErrorMessage.tryAgain,
            onPressed: onRetry,
            variant: AppButtonVariant.outlined,
            icon: Icons.refresh_rounded,
            expandWidth: false,
          ),
        ],
      ],
    );
  }
}
