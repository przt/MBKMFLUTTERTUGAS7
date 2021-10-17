import 'package:http/http.dart' as http;
import 'package:tugas_kelompok/model/article_model.dart';
import 'dart:convert';

import 'package:tugas_kelompok/model/login_model.dart';

class LoginService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    const String url = "https://gits-msib.my.id/wp-json/jwt-auth/v1/token";

    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('failed to load data');
    }
  }
}

class ArticleService {
  final String url = "https://gits-msib.my.id/wp-json/wp/v2/posts";

  Future<List<Article>> getPosts() async {
    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Article> posts = body
          .map(
            (dynamic item) => Article.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
