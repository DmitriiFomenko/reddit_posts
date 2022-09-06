import 'package:flutter/material.dart';
import 'package:reddit_post/domain/models/full_post.dart';
import 'package:reddit_post/screens/posts/widgets/body_post.dart';
import 'package:reddit_post/screens/widgets/column_rating.dart';
import 'package:reddit_post/screens/widgets/row_actions.dart';
import 'package:reddit_post/utils/colors/app_colors.dart';

class CardPost extends StatelessWidget {
  const CardPost({
    Key? key,
    required this.previewPost,
    required this.onPressedCard,
    required this.onPressedComments,
    required this.onPressedShare,
    required this.onPressedSave,
    required this.onPressedAnother,
  }) : super(key: key);

  final VoidCallback onPressedCard;
  final FullPost previewPost;
  final VoidCallback onPressedComments;
  final VoidCallback onPressedShare;
  final VoidCallback onPressedSave;
  final VoidCallback onPressedAnother;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColor.widgetBackgroundGray,
        border: Border(
          top: BorderSide(
            color: AppColor.borderGray,
          ),
          left: BorderSide(
            color: AppColor.borderGray,
          ),
          bottom: BorderSide(
            color: AppColor.borderGray,
          ),
        ),
      ),
      child: InkWell(
        onTap: onPressedCard,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 50,
              child: ColumnRating(
                rating: previewPost.rating.toString(),
              ),
            ),
            Expanded(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppColor.widgetBackgroundWhite,
                  border: Border(
                    top: BorderSide(
                      color: AppColor.borderGray,
                    ),
                    right: BorderSide(
                      color: AppColor.borderGray,
                    ),
                    bottom: BorderSide(
                      color: AppColor.borderGray,
                    ),
                  ),
                ),
                child: Container(
                  constraints: const BoxConstraints(
                    minHeight: 95,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BodyPost(
                        title: previewPost.title,
                        urlImage: previewPost.urlImage,
                      ),
                      RowActions(
                        countComments: previewPost.countComments,
                        onPressedComments: onPressedComments,
                        onPressedShare: onPressedShare,
                        onPressedSave: onPressedShare,
                        onPressedAnother: onPressedAnother,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
