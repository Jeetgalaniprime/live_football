import '../utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? suffixText;
  final String defaultSuffixText;
  final double? borderRadius;
  final bool readOnly;
  final int? maxLength;
  final Color? bgColor;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final Color? borderColor;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final ValueChanged<String>? onFieldSubmitted;
  const PrimaryTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixText,
    this.defaultSuffixText = "",
    this.borderRadius,
    this.readOnly = false,
    this.maxLength,
    this.bgColor,
    this.contentPadding,
    this.textInputAction,
    this.borderColor,
    this.focusNode,
    this.inputFormatters,
    this.initialValue,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveBorderColor = borderColor ?? AppColors.whiteColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: EdgeInsets.only(bottom: 3.h),
            child: Text(
              labelText ?? '',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: TextFormField(initialValue: initialValue,
            controller: controller,
            inputFormatters: inputFormatters,
            obscureText: isPassword,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onChanged: onChanged,
            readOnly: readOnly,
            focusNode: focusNode,
            cursorColor: AppColors.whiteColor,
            maxLength: maxLength,
            onFieldSubmitted: onFieldSubmitted,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              isDense: true,
              counterText: '',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
                borderSide: BorderSide(color: effectiveBorderColor, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
                borderSide: BorderSide(color: effectiveBorderColor),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              suffixText: suffixText ?? defaultSuffixText,
              contentPadding:
                  contentPadding ??
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
                borderSide: BorderSide(color: effectiveBorderColor, width: 1.5),
              ),
              fillColor: bgColor ?? Colors.transparent,
              filled: bgColor != null,
            ),
          ),
        ),
      ],
    );
  }
}
