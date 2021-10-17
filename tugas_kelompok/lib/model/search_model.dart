// To parse this JSON data, do
//
//     final searchArticle = searchArticleFromMap(jsonString);

import 'dart:convert';

class SearchArticle {
  SearchArticle({
    required this.id,
    required this.title,
    required this.url,
  });

  int id;
  String title;
  String url;

  factory SearchArticle.fromJson(String str) =>
      SearchArticle.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SearchArticle.fromMap(Map<String, dynamic> json) => SearchArticle(
        id: json["id"],
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "url": url,
      };
}
