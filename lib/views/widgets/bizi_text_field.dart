import 'package:bizi/constants/b_colors.dart';
import 'package:flutter/material.dart';

class BiziTextField extends StatelessWidget {
  final int maxLines;
  final int? minLines;
  final String? hintText;
  final double? width;
  final int? hintMaxLines;
  final bool filled;
  final bool obscureText;
  final bool? enabled;
  final bool autofocus;
  final Color? filledColor;
  final Color? cursorColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final String? initialValue;
  final OutlineInputBorder? focusedBorder;
  final FocusNode? focusNode;
  final Function(PointerDownEvent)? onTapOutside;
  final TextEditingController? controller;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;
  final AutovalidateMode? autovalidateMode;

  const BiziTextField({
    super.key,
    this.maxLines = 1,
    this.minLines,
    required this.hintText,
    this.width,
    this.filled = false,
    this.filledColor,
    this.suffixIcon,
    this.prefixIcon,
    this.hintStyle,
    this.initialValue,
    this.focusedBorder,
    this.onTapOutside,
    this.onTap,
    this.onChanged,
    this.onEditingComplete,
    this.focusNode,
    this.controller,
    this.style,
    this.hintMaxLines,
    this.keyboardType,
    this.enabled,
    this.autofocus = false,
    this.obscureText = false,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.autovalidateMode,
    this.cursorColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width,
      child: TextFormField(
        maxLines: maxLines,
        minLines: minLines,
        initialValue: initialValue,
        controller: controller,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        obscureText: obscureText,
        enabled: enabled,
        autofocus: autofocus,
        cursorColor: cursorColor,
        autovalidateMode: autovalidateMode,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintMaxLines: hintMaxLines,
          hintStyle: hintStyle ??
              theme.textTheme.bodyMedium?.copyWith(color: BColors.white),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: BColors.white,
              width: 2.0,
            ),
          ),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: BColors.white,
                  width: 2.0,
                ),
              ),
          fillColor: filledColor,
          filled: filled,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
        validator: (val) => validator != null ? validator!(val) : null,
        focusNode: focusNode,
        style: style,
        onChanged: onChanged != null
            ? (String val) {
                onChanged!(val);
              }
            : null,
        onTap: onTap != null
            ? () {
                onTap!();
              }
            : null,
        onTapOutside: onTapOutside != null
            ? (PointerDownEvent event) {
                onTapOutside!(event);
              }
            : null,
        onEditingComplete: onEditingComplete != null
            ? () {
                onEditingComplete!();
              }
            : null,
      ),
    );
  }
}
