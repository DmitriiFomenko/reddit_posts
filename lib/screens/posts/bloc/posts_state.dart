part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsLoadingInProgress extends PostsState {
  const PostsLoadingInProgress();
}

class PostsLoadingFailure extends PostsState {
  const PostsLoadingFailure();
}

class PostsLoadingDone extends PostsState {
  const PostsLoadingDone({
    required this.posts,
  });

  final List<FullPost> posts;

  @override
  List<Object> get props => [posts];
}
