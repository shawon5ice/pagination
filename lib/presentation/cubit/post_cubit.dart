import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pagination/services/post_service.dart';

import '../../data/repository/post_repository.dart';
import '../../models/post.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this.repository) : super(PostInitial());
  int page =1;
  final PostRepository repository;

  void loadPosts(){
    if(state is PostLoading) return;

    final currentState = state;
    var oldPosts = <Post>[];
    if(currentState is PostLoaded){
      oldPosts = currentState.posts;
    }
    emit(PostLoading(oldPosts,isFirstFetch: page==1));

    repository.fetchPost(page);
  }
}
