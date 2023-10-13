import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Custom Textformfield with predefined params, style, etc.
class RsTextFormField extends StatelessWidget {
  const RsTextFormField({
    required this.controller,
    required this.label,
    this.validator,
    this.keyboardType,
    this.enabled,
    this.textStyle,
    this.onChanged,
    this.onTapOutside,
    this.onTap,
    this.hintText,
    this.hintTextStyle,
    this.inputFormatters,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength = 255,
    this.obscureText = false,
    this.readOnly = false,
    this.alignLabelWithHint = true,
    this.addEmailValidation = false,
    this.borderRadius = 20.0,
    this.contentPadding = 12.0,
    this.counterText = "",
    super.key,
  });

  final TextEditingController controller;

  final String label;

  /// Default is `""`, i.e., No counter text will be visible, (like 0/255 length).
  final String? counterText;

  final String? hintText;
  final TextStyle? hintTextStyle;

  /// Default:
  ///
  /// ```dart
  /// (String? value) {
  ///       if (controller.text.trim().length < 4 ||
  ///           controller.text.trim().length > 255) {
  ///         return "It should be 4 to 255 characters long.";
  ///       } else if (!isEmailValid(controller.text.trim()) &&
  ///              addEmailValidation!) {
  ///            return 'Please enter a valid email address';
  ///          }
  ///       return null;
  ///     },
  ///```
  /// Warning: Remember `value` is not trimmed one, so use `textEditingController` in case.
  final String? Function(String? value)? validator;
  final Function(String)? onChanged;

  /// Default is `Unfocus`, i.e., hide keyboard.
  final Function(PointerDownEvent)? onTapOutside;
  final VoidCallback? onTap;

  final TextInputType? keyboardType;

  final bool? enabled;

  /// Default is `false`
  final bool? obscureText;

  /// Default is `false`
  final bool? addEmailValidation;

  /// Default is `true`
  ///
  /// If `false` && texformfield contains a multiline [TextField] ([TextField.maxLines] is null or > 1)
  /// to override the default behavior of aligning the label with the center of the [TextField].
  final bool? alignLabelWithHint;

  /// Default is `false`
  final bool? readOnly;

  /// Default is `255` characters.
  final int? maxLength;

  /// Default is `1`
  final int? minLines;

  /// Default is `1`
  final int? maxLines;

  /// Default is `20.0`
  final double? borderRadius;

  /// Default is `12.0`
  final double? contentPadding;

  final TextStyle? textStyle;

  /// e.g.
  ///
  /// ```dart
  /// inputFormatters: <TextInputFormatter>[
  /// FilteringTextInputFormatter.digitsOnly, // Allow only digits
  /// FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')), // Allow digits and at most 2 decimal places
  /// FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')), // Allow alphabets only
  /// FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9!@#$%^&*()_+,\-=\[\]{};':"\\|<>\?]+')), // Allow alphanumeric and special characters
  /// ...
  /// ...
  /// ],
  /// ```
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator ??
          (String? value) {
            if (controller.text.trim().length < 4 ||
                controller.text.trim().length > 255) {
              return "It should be 4 to 255 characters long.";
            } else if (!isEmailValid(controller.text.trim()) &&
                addEmailValidation!) {
              return 'Please enter a valid email address';
            }
            return null;
          },
      onChanged: onChanged,
      onTap: onTap,
      onTapOutside: onTapOutside ??
          (event) {
            FocusScope.of(context).unfocus();
          },
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      enabled: enabled,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      obscureText: obscureText!,
      readOnly: readOnly!,
      style: textStyle,
      decoration: InputDecoration(
        alignLabelWithHint: alignLabelWithHint,
        labelText: label,
        hintText: hintText,
        hintStyle: hintTextStyle,
        filled: true,
        counterText: counterText,
        contentPadding: EdgeInsets.all(contentPadding!),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  bool isEmailValid(String email) {
    // Regular expression for email validation
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }
}
