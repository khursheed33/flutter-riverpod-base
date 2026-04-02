import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod_base/core/design/widgets/app_text_field.dart';
import 'package:flutter_riverpod_base/features/presentation/widgets/app_title.dart';

@Deprecated('Prefer AppTextField')
class AppInputForm extends StatelessWidget {
  const AppInputForm({
    super.key,
    this.passwordVisiblityHandler,
    this.isPasswordVisible,
    this.obscured = false,
    this.onChangeHandler,
    this.initialValue,
    this.inputAction,
    this.fontWeight,
    this.isDisabled,
    this.controller,
    this.prefixIcon,
    this.inputLabel,
    this.fillColor,
    this.formatter,
    this.maxLength,
    this.inputType,
    this.fontSize,
    this.hintText,
    this.maxLines,
    this.minLines,
    this.validator,
    this.textAlign,
  });

  final int? maxLines;
  final bool obscured;
  final int? minLines;
  final int? maxLength;
  final Color? fillColor;
  final String? hintText;
  final double? fontSize;
  final bool? isDisabled;
  final String? inputLabel;
  final TextAlign? textAlign;
  final IconData? prefixIcon;
  final String? initialValue;
  final FontWeight? fontWeight;
  final bool? isPasswordVisible;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextEditingController? controller;
  final ValueChanged<String>? onChangeHandler;
  final List<TextInputFormatter>? formatter;
  final FormFieldValidator<String>? validator;
  final VoidCallback? passwordVisiblityHandler;

  @override
  Widget build(BuildContext context) {
    final field = AppTextField(
      controller: controller,
      initialValue: initialValue,
      label: inputLabel,
      hint: hintText,
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      suffixIcon: isPasswordVisible == null
          ? null
          : IconButton(
              onPressed: passwordVisiblityHandler,
              icon: Icon(
                isPasswordVisible! ? Icons.visibility_rounded : Icons.visibility_off_rounded,
              ),
            ),
      obscureText: obscured,
      readOnly: isDisabled ?? false,
      enabled: !(isDisabled ?? false),
      keyboardType: inputType,
      textInputAction: inputAction,
      onChanged: onChangeHandler,
      validator: validator,
      inputFormatters: formatter,
      maxLines: maxLines ?? 1,
      minLines: minLines,
      maxLength: maxLength,
    );

    if (inputLabel == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
        child: field,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      child: Column(
        crossAxisAlignment: textAlign == TextAlign.right
            ? CrossAxisAlignment.end
            : textAlign == TextAlign.center
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 6),
            child: AppTitle(
              inputLabel!,
              fontSize: 14,
              variant: AppTitleVariant.label,
              textAlign: textAlign,
            ),
          ),
          field,
        ],
      ),
    );
  }
}
