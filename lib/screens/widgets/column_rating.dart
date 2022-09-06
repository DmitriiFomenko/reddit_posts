import 'package:flutter/material.dart';
import 'package:reddit_post/screens/posts/widgets/template_button.dart';

class ColumnRating extends StatelessWidget {
  const ColumnRating({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final String rating;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TemplateButton(
            onPressed: () {},
            iconData: Icons.keyboard_arrow_up,
          ),
          Text(rating),
          TemplateButton(
            onPressed: () {},
            iconData: Icons.keyboard_arrow_down,
          ),
        ],
      ),
    );
  }
}
