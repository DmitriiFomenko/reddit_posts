import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_post/screens/posts/bloc/posts_bloc.dart';
import 'package:reddit_post/screens/posts/widgets/card_post.dart';
import 'package:reddit_post/utils/colors/app_colors.dart';
import 'package:reddit_post/utils/routes/name_routes.dart';
import 'package:reddit_post/utils/strings/app_strings.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundGray,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: BlocBuilder<PostsBloc, PostsState>(
              builder: (context, state) {
                if (state is PostsLoadingInProgress) {
                  return const CircularProgressIndicator(
                    color: AppColor.circularIndicatorGray,
                  );
                }
                if (state is PostsLoadingDone) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<PostsBloc>().add(const PostsUpdated());
                    },
                    child: ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        final isLast = index == state.posts.length - 1;
                        final post = state.posts[index];

                        return Padding(
                          padding: EdgeInsets.only(
                            top: 15,
                            bottom: isLast ? 15 : 0,
                          ),
                          child: CardPost(
                            onPressedCard: () {
                              Navigator.of(context).pushNamed(
                                NameRoutes.post,
                                arguments: post,
                              );
                            },
                            previewPost: post,
                            onPressedComments: () {},
                            onPressedShare: () {},
                            onPressedSave: () {},
                            onPressedAnother: () {},
                          ),
                        );
                      },
                    ),
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      AppStrings.loadIsFailed,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        context.read<PostsBloc>().add(const PostsUpdated());
                      },
                      child: const Text(
                        AppStrings.tryToUpdate,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
