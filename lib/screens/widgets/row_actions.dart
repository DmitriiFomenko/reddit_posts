import 'package:flutter/material.dart';
import 'package:reddit_post/screens/posts/widgets/template_button.dart';
import 'package:reddit_post/utils/strings/app_strings.dart';

class RowActions extends StatelessWidget {
  const RowActions({
    Key? key,
    required this.countComments,
    required this.onPressedComments,
    required this.onPressedShare,
    required this.onPressedSave,
    required this.onPressedAnother,
  }) : super(key: key);

  final int countComments;
  final VoidCallback onPressedComments;
  final VoidCallback onPressedShare;
  final VoidCallback onPressedSave;
  final VoidCallback onPressedAnother;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TemplateButton(
          onPressed: onPressedComments,
          iconData: Icons.mode_comment_outlined,
          text: '$countComments ${AppStrings.comments}',
        ),
        TemplateButton(
          onPressed: onPressedShare,
          iconData: Icons.share_outlined,
          text: AppStrings.share,
        ),
        TemplateButton(
          onPressed: onPressedSave,
          iconData: Icons.bookmark_outline,
          text: AppStrings.save,
        ),
        TemplateButton(
          onPressed: onPressedAnother,
          iconData: Icons.more_horiz,
        ),
      ],
    );
  }
}
