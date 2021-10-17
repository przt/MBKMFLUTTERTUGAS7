import 'dart:convert';

class Welcome {
  Welcome({
    required this.id,
    required this.date,
    required this.link,
    required this.title,
    required this.content,
    required this.author,
  });

  int id;
  DateTime date;
  String link;
  Guid title;
  Content content;
  int author;

  factory Welcome.fromJson(String str) => Welcome.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        link: json["link"],
        title: Guid.fromMap(json["title"]),
        content: Content.fromMap(json["content"]),
        author: json["author"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "date": date.toIso8601String(),
        "link": link,
        "title": title.toMap(),
        "content": content.toMap(),
        "author": author,
      };
}

class Content {
  Content({
    required this.rendered,
    required this.protected,
  });

  String rendered;
  bool protected;

  factory Content.fromJson(String str) => Content.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Content.fromMap(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
        protected: json["protected"],
      );

  Map<String, dynamic> toMap() => {
        "rendered": rendered,
        "protected": protected,
      };
}

class Guid {
  Guid({
    required this.rendered,
  });

  String rendered;

  factory Guid.fromJson(String str) => Guid.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Guid.fromMap(Map<String, dynamic> json) => Guid(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toMap() => {
        "rendered": rendered,
      };
}
