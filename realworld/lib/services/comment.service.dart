//https://github.com/gothinkster/realworld/tree/master/api

import 'package:realworld/utils/http.dart';

class CommentsService {
  static create(String slug, Map<String, dynamic> comment) async =>
      await http.post('/articles/$slug/comments', data: comment);

  static forArticle(String slug) async => await http.get('/articles/$slug/comments');

  static delete(String slug, commentId) async =>
      await http.delete('/articles/$slug/comments/$commentId');
}
