import 'package:reddit_post/domain/models/full_post.dart';

abstract class PostsRepository {
  int get maxCountItems;

  Future<List<FullPost>> loadPosts();
}
