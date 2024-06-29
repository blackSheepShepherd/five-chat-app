import 'package:five_chat_app/app/theme/app_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    required this.inputFormatter,
    required this.onChanged,
    required this.keyboardType,
    required this.hintText,
    this.obscureText = false,
    this.autoFillHints,
    this.prefixIcon,
    super.key,
  });

  final TextInputFormatter inputFormatter;
  final ValueSetter<String> onChanged;
  final TextInputType keyboardType;
  final String hintText;
  final List<String>? autoFillHints;
  final Icon? prefixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.onPrimary,
            width: 2,
          ),
        ),
      ),
      height: AppStyling.inputHeight,
      child: Center(
        child: TextFormField(
          keyboardType: keyboardType,
          //cursorColor: Styling.darkPurpleColor,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            prefixIcon: prefixIcon,
          ),
          style: AppStyling.textFieldTextStyle,
          autocorrect: false,
          inputFormatters: [inputFormatter],
          onChanged: onChanged,
          autofillHints: autoFillHints,
          obscureText: obscureText,
        ),
      ),
    );
  }
}
