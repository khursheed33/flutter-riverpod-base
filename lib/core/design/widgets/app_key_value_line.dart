import 'package:flutter/material.dart';

/// Single-line "Label: value" or rich spans for metadata rows.
class AppKeyValueLine extends StatelessWidget {
  const AppKeyValueLine({
    super.key,
    required this.value,
    this.label,
    this.labelStyle,
    this.valueStyle,
    this.trailingSpans,
  });

  final String value;
  final String? label;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final List<InlineSpan>? trailingSpans;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final base = theme.textTheme.bodyMedium ?? const TextStyle();
    return Text.rich(
      TextSpan(
        style: base,
        children: [
          if (label != null)
            TextSpan(
              text: label,
              style: labelStyle ?? base.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
          if (label != null) const TextSpan(text: ' '),
          TextSpan(
            text: value,
            style: valueStyle ?? base.copyWith(fontWeight: FontWeight.w600),
          ),
          if (trailingSpans != null) ...trailingSpans!,
        ],
      ),
    );
  }
}
