import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_post/data/repository/posts_repository_impl.dart';
import 'package:reddit_post/screens/posts/bloc/posts_bloc.dart';
import 'package:reddit_post/utils/routes/app_router.dart';

void setup() {}

void main() {
  setup();
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PostsBloc(
            PostsRepositoryImpl(
              Dio(),
            ),
          )..add(const PostsUpdated()),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
