import 'package:flutter/material.dart';
import 'package:reddit_post/utils/colors/app_colors.dart';

class TemplateButton extends StatelessWidget {
  const TemplateButton({
    Key? key,
    required this.onPressed,
    required this.iconData,
    this.text,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData iconData;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 3.0,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: AppColor.buttonGray,
            ),
            if (text != null) ...[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 1.0,
                ),
                child: Text(
                  text!,
                  style: const TextStyle(
                    color: AppColor.fontGray,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
