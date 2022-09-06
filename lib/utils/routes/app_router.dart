import 'package:flutter/material.dart';
import 'package:reddit_post/domain/models/full_post.dart';
import 'package:reddit_post/screens/post/post_screen.dart';
import 'package:reddit_post/screens/posts/posts_screen.dart';
import 'package:reddit_post/utils/routes/name_routes.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case NameRoutes.posts:
        return MaterialPageRoute(
          builder: (_) => const PostsScreen(),
        );
      case NameRoutes.post:
        FullPost fullPost = routeSettings.arguments as FullPost;
        return MaterialPageRoute(
          builder: (_) => PostScreen(
            fullPost: fullPost,
          ),
        );
      default:
        debugPrint('Page "${routeSettings.name}" not found');
        return MaterialPageRoute(
          builder: (_) => const PostsScreen(),
        );
    }
  }
}
