import 'package:flutter/material.dart';
import 'package:themar_app/core/config/app_theme.dart';

class ClickableText extends StatelessWidget {
  VoidCallback? onPressed;
  String clickableText;
  String text;
  TextStyle? style;
  ClickableText(
      {Key? key,
      required this.clickableText,
      this.onPressed,
      this.style,
      this.text = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(color: AppTheme.colorText2),
        ),
        SizedBox(
          width: 10,
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              clickableText,
              style: style,
            )),
      ],
    );
  }
}
