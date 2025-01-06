import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Corrected the import for Flutter SVG

import '../../utils/colors.dart';
import '../../utils/custom_text_style.dart';

class CustomTextField extends StatelessWidget {
  final Function(String)? onValueChange;
  final FocusNode? focusNode;
  final String hint;
  final IconData? preIconPath;
  final String? suffixIconPath;
  final double? preIconSize;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Color? border;
  final Color? fillColor;
  final bool readOnly;
  final bool showError;
  final bool autofocus;
  final String? labelText;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final int? maxCharacters;
  final TextCapitalization textCapitalization;
  final Color? prefixIconColor;

  const CustomTextField({
    super.key,
    this.fillColor,
    required this.hint,
    this.preIconPath,
    this.suffixIconPath,
    this.onValueChange,
    this.controller,
    this.validator,
    required this.textInputAction,
    required this.textInputType,
    this.border,
    this.readOnly = false,
    this.showError = true,
    this.textCapitalization = TextCapitalization.sentences,
    this.onTap,
    this.onSubmitted,
    this.autofocus = false,
    this.maxCharacters,
    this.focusNode,
    this.labelText,
    this.prefixIconColor, this.preIconSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      maxLength: maxCharacters,
      autofocus: autofocus,
      textCapitalization: textCapitalization,
      onFieldSubmitted: onSubmitted,
      onTap: onTap,
      readOnly: readOnly,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      maxLines: 1,
      validator: validator,
      controller: controller,
      onChanged: onValueChange,
      decoration: InputDecoration(
        label: labelText != null
            ? Text(
                labelText!,
                style: CustomTextStyles.f16W400(
                  color: AppColors.primaryColor,
                  
                ),
              )
            : null,
        fillColor: fillColor ?? Colors.transparent,
        filled: fillColor != null,
        prefixIcon: preIconPath != null
            ? Icon(
                preIconPath,
                color: prefixIconColor ?? AppColors.secondaryTextColor,
                size: preIconSize,
              )
            : null,
        suffixIcon: suffixIconPath != null
            ? SvgPicture.asset(suffixIconPath!, fit: BoxFit.scaleDown)
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              width: 1, color: border ?? AppColors.secondaryTextColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(width: 1, color: border ?? AppColors.errorColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(width: 1, color: border ?? AppColors.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(width: 1, color: border ?? AppColors.errorColor),
        ),
        errorStyle: showError
            ? const TextStyle(fontSize: 12)
            : const TextStyle(fontSize: 0),
        hintText: hint,
        hintStyle:
            CustomTextStyles.f16W400(color: AppColors.secondaryTextColor),
      ),
      style: CustomTextStyles.f16W400(
          color: readOnly ? AppColors.secondaryTextColor : null),
    );
  }
}
