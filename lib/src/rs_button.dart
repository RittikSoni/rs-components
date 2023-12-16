import 'package:flutter/material.dart';
import 'package:reusable_components/src/constants/theme.dart';

class RsButton extends StatelessWidget {
  const RsButton(
      {required this.label,
      this.onTap,
      this.bg,
      this.fg,
      this.splashColor,
      this.icon,
      this.width,
      this.buttonBorderRadius,
      this.mainAxisAlignment,
      this.insidePadding,
      this.isDisable = false,
      super.key,
      this.shadowColor,
      this.elevation});
  final String label;
  final IconData? icon;
  final Color? fg;

  /// Default is `KTheme.appBg`
  final Color? bg;
  final Color? splashColor;

  final Color? shadowColor;

  /// Default is `8.0`
  final double? insidePadding;
  final double? elevation;

  /// Default is `double.infinity`
  final double? width;
  final double? buttonBorderRadius;
  final VoidCallback? onTap;

  /// Default is `spaceBetween`.
  final MainAxisAlignment? mainAxisAlignment;

  /// Default is `false`.
  final bool? isDisable;

  @override
  Widget build(BuildContext context) {
    final BorderRadius btnborderRadius =
        BorderRadius.circular(buttonBorderRadius ?? 10.0);
    return Card(
      shadowColor: shadowColor,
      elevation: elevation,
      child: SizedBox(
        width: width ?? double.infinity,
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: btnborderRadius,
          ),
          color: isDisable! ? RsTheme.disableBg : bg ?? RsTheme.buttonBg,
          child: InkWell(
            borderRadius: btnborderRadius,
            splashColor: splashColor ?? RsTheme.splashColor,
            onTap: onTap ?? () {},
            child: Padding(
              padding: EdgeInsets.all(insidePadding ?? 8.0),
              child: Row(
                mainAxisAlignment:
                    mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    label,
                    style: RsTheme.titleTextStyle(
                      textColor: isDisable! ? RsTheme.disableFg : null,
                    ),
                  ),
                  if (icon != null)
                    Icon(
                      icon,
                      color: isDisable!
                          ? RsTheme.disableFg
                          : fg ?? RsTheme.buttonFg,
                    )
                  else
                    Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
