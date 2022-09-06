import 'package:dio/dio.dart';
import 'package:reddit_post/domain/models/full_post.dart';
import 'package:reddit_post/domain/repository/posts_repository.dart';

class PostsRepositoryImpl implements PostsRepository {
  final Dio _dio;

  PostsRepositoryImpl(this._dio);

  @override
  int get maxCountItems => 25;

  static const _baseURL = 'https://reddit.com/r/flutterdev/';
  static const _postsEndpoint = '${_baseURL}new.json';

  @override
  Future<List<FullPost>> loadPosts() async {
    final response = await _dio.get(_postsEndpoint);

    final rawPosts = response.data['data']['children'] as List<dynamic>;

    final posts =
        rawPosts.map((post) => FullPost.fromJson(post['data'])).toList();

    final filteredPosts = _filterToMaxAmount(posts);

    return filteredPosts;
  }

  List<FullPost> _filterToMaxAmount(List<FullPost> posts) {
    return posts.take(maxCountItems).toList();
  }
}
