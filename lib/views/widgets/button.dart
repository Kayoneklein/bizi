import 'package:bizi/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color? color;
  final Color? borderSideColor;
  final Color? backgroundColor;
  final Size? size;
  final EdgeInsets padding;
  final double borderRadius;
  final double borderWidth;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;

  const Button({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.borderSideColor,
    this.backgroundColor,
    this.size,
    this.padding = EdgeInsets.zero,
    this.borderRadius = 18,
    this.borderWidth = 1,
    this.fontWeight,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: borderSideColor != null
                ? BorderSide(color: borderSideColor!, width: borderWidth)
                : BorderSide.none,
          ),
        ),
        fixedSize: size != null ? MaterialStateProperty.all<Size>(size!) : null,
        backgroundColor: backgroundColor != null
            ? MaterialStateProperty.all<Color>(
                backgroundColor!,
              )
            : null,
      ),
      child: Padding(
        padding: padding,
        child: Center(
          child: CustomText(
            text: text,
            textAlign: TextAlign.center,
            style: textStyle ??
                theme.textTheme.labelMedium?.copyWith(
                  color: color,
                  fontWeight: fontWeight,
                ),
          ),
        ),
      ),
    );
  }
}
