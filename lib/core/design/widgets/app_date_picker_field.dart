import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/app_theme_context.dart';
import 'package:flutter_riverpod_base/core/design/app_tokens.dart';
import 'package:flutter_riverpod_base/core/design/widgets/app_surface.dart';
import 'package:flutter_riverpod_base/features/presentation/widgets/app_title.dart';
import 'package:intl/intl.dart';

/// Tappable field that opens the platform date picker.
class AppDatePickerField extends StatelessWidget {
  const AppDatePickerField({
    super.key,
    required this.selectedDate,
    this.onDateSelected,
    this.label,
    this.labelFontSize,
    this.firstDate,
    this.lastDate,
    this.initialPickerDate,
    this.dateFormatPattern,
    this.padding,
    this.margin,
    this.radius,
    this.surfaceColor,
    this.iconColor,
    this.iconSize,
    this.valueFontSize,
    this.valueFontWeight = FontWeight.w600,
    this.valueColor,
  });

  final DateTime selectedDate;
  final ValueChanged<DateTime>? onDateSelected;
  final String? label;
  /// When non-null, overrides [TextTheme] for the label only.
  final double? labelFontSize;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialPickerDate;
  final String? dateFormatPattern;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? radius;
  final Color? surfaceColor;
  final Color? iconColor;
  final double? iconSize;
  /// When non-null, overrides [TextTheme] for the value line only.
  final double? valueFontSize;
  final FontWeight valueFontWeight;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final dim = context.appDim;
    final resolvedIconSize = iconSize ?? dim.datePickerIconSize;
    final borderR = radius ?? AppRadius.sm;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          AppTitle(
            label!,
            variant: AppTitleVariant.label,
            fontSize: labelFontSize,
          ),
        if (label != null) const SizedBox(height: AppSpace.xs),
        InkWell(
          borderRadius: BorderRadius.circular(borderR),
          onTap: onDateSelected == null
              ? null
              : () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: initialPickerDate ?? selectedDate,
                    firstDate: firstDate ?? DateTime(1900),
                    lastDate: lastDate ?? DateTime(2100),
                  );
                  if (picked != null) {
                    onDateSelected!(picked);
                  }
                },
          child: AppSurface(
            margin: margin,
            padding: padding ?? const EdgeInsets.all(AppSpace.sm),
            radius: borderR,
            color: surfaceColor,
            child: Row(
              children: [
                Expanded(
                  child: AppTitle(
                    DateFormat(dateFormatPattern ?? 'MM-dd-yyyy').format(selectedDate),
                    fontSize: valueFontSize,
                    fontWeight: valueFontWeight,
                    variant: AppTitleVariant.body,
                    color: valueColor,
                  ),
                ),
                Icon(
                  Icons.calendar_month_rounded,
                  size: resolvedIconSize,
                  color: iconColor ?? cs.primary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
