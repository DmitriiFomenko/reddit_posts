import 'package:flutter/material.dart';
import 'package:reddit_post/domain/models/full_post.dart';
import 'package:reddit_post/screens/posts/widgets/body_post.dart';
import 'package:reddit_post/screens/widgets/column_rating.dart';
import 'package:reddit_post/screens/widgets/row_actions.dart';
import 'package:reddit_post/utils/colors/app_colors.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({
    Key? key,
    required this.fullPost,
  }) : super(key: key);

  final FullPost fullPost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundGray,
      appBar: AppBar(
        backgroundColor: AppColor.appBarBlack,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColor.widgetBackgroundWhite,
                border: Border.all(
                  color: AppColor.borderGray,
                ),
              ),
              child: SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 50,
                      child: ColumnRating(
                        rating: fullPost.rating.toString(),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        minHeight: 95,
                        maxWidth: MediaQuery.of(context).size.width - 80,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BodyPost(
                            title: fullPost.title,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Expanded(
                              child: Text(
                                fullPost.selftext,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          RowActions(
                            countComments: fullPost.countComments,
                            onPressedComments: () {},
                            onPressedShare: () {},
                            onPressedSave: () {},
                            onPressedAnother: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
