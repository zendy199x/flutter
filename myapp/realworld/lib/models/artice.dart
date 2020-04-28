//https://github.com/gothinkster/realworld/tree/master/api

import './author.dart';

class Article {
  final String slug;
  final String title;
  final String description;
  final String body;
  final List tag;
  final String createAt;
  final String updateAt;
  final String favorited;
  final int favoritesCount;
  final Author author;

  Article(
      {this.slug,
      this.title,
      this.description,
      this.body,
      this.tag,
      this.createAt,
      this.updateAt,
      this.favorited,
      this.favoritesCount,
      this.author});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        slug: json['slug'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        body: json['body'] as String,
        tag: json['tagList'] as List,
        createAt: json['createAt'] as String,
        updateAt: json['updateAt'] as String,
        favorited: json['favorited'] as String,
        favoritesCount: json['favoritesCount'] as int,
        author: Author.fromJson(json['author']));
  }
}
