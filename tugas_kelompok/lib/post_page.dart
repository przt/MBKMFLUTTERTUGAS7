import 'package:flutter/material.dart';
import 'package:tugas_kelompok/model/article_model.dart';
import 'package:tugas_kelompok/api/api_service.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final ArticleService articleService = ArticleService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: FutureBuilder(
        future: articleService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> posts = snapshot.requireData;
            return ListView(
              children: posts
                  .map(
                    (Article post) => ListTile(
                      title: Text(post.link),
                      subtitle: Text("${post.id}"),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
