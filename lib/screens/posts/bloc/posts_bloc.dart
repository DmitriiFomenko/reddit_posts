import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reddit_post/domain/models/full_post.dart';
import 'package:reddit_post/domain/repository/posts_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository _postsRepository;

  PostsBloc(this._postsRepository) : super(const PostsLoadingInProgress()) {
    on<PostsUpdated>(_onPostsUpdated);
  }

  void _onPostsUpdated(PostsUpdated event, Emitter<PostsState> emit) async {
    try {
      emit(const PostsLoadingInProgress());

      final posts = await _postsRepository.loadPosts();

      emit(PostsLoadingDone(posts: posts));
    } catch (e) {
      emit(const PostsLoadingFailure());
    }
  }
}
