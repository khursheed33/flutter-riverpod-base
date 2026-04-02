import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/widgets/app_key_value_line.dart';

@Deprecated('Use AppKeyValueLine')
class AppRichText extends StatelessWidget {
  const AppRichText({
    super.key,
    required this.value,
    this.label,
    this.labelColor,
    this.valueColor,
    this.labelSize,
    this.valueSize,
    this.postFixText,
    this.labelFontWeight,
    this.valueFontWeight,
  });

  final String? label;
  final String value;
  final Color? labelColor;
  final Color? valueColor;
  final double? labelSize;
  final double? valueSize;
  final List<TextSpan>? postFixText;
  final FontWeight? labelFontWeight;
  final FontWeight? valueFontWeight;

  @override
  Widget build(BuildContext context) {
    return AppKeyValueLine(
      label: label,
      value: value,
      labelStyle: TextStyle(
        fontSize: labelSize ?? 14,
        fontWeight: labelFontWeight ?? FontWeight.normal,
        color: labelColor,
      ),
      valueStyle: TextStyle(
        fontSize: valueSize ?? 14,
        fontWeight: valueFontWeight ?? FontWeight.bold,
        color: valueColor,
      ),
      trailingSpans: postFixText,
    );
  }
}
