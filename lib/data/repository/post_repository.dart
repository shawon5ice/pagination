import 'package:pagination/models/post.dart';
import 'package:pagination/services/post_service.dart';

class PostRepository{
  final PostService service;

  PostRepository(this.service);
  Future<List<Post>> fetchPost(int page) async{
    final posts = await service.fetchPost(page);
    return posts.map((e) => Post.fromJson(e)).toList();
  }

}