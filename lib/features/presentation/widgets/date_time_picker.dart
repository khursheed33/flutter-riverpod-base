import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/core/design/widgets/app_date_picker_field.dart';

@Deprecated('Use AppDatePickerField')
class MMDateTimePicker extends StatelessWidget {
  const MMDateTimePicker({
    super.key,
    this.pickedDateHandler,
    required this.selectedDate,
    this.initialDate,
    this.firstDate,
    this.endDate,
    this.iconColor,
    this.iconSize,
    this.titleSize,
    this.label,
    this.labelSize,
    this.titleColor,
    this.bgColor,
    this.padding,
    this.margin,
    this.radius,
    this.dateFormat,
  });

  final void Function(DateTime dateTime)? pickedDateHandler;
  final DateTime selectedDate;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? endDate;
  final Color? iconColor;
  final double? iconSize;
  final double? titleSize;
  final String? label;
  final double? labelSize;
  final Color? titleColor;
  final Color? bgColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? radius;
  final String? dateFormat;

  @override
  Widget build(BuildContext context) {
    return AppDatePickerField(
      selectedDate: selectedDate,
      onDateSelected: pickedDateHandler,
      initialPickerDate: initialDate,
      firstDate: firstDate,
      lastDate: endDate,
      label: label,
      labelFontSize: labelSize,
      dateFormatPattern: dateFormat,
      padding: padding,
      margin: margin,
      radius: radius,
      surfaceColor: bgColor,
      iconColor: iconColor,
      iconSize: iconSize,
      valueFontSize: titleSize,
      valueFontWeight: FontWeight.bold,
      valueColor: titleColor,
    );
  }
}
