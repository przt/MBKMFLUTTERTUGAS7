import 'package:http/http.dart';
import 'package:tugas_kelompok/model/article_model.dart';
import 'dart:convert';

import 'package:tugas_kelompok/model/login_model.dart';
import 'package:tugas_kelompok/model/search_model.dart';

class ConstUrl {
  static const String baseUrl = 'https://gits-msib.my.id/wp-json';
  static String _loginToken = '';

  String get token => _loginToken;
  void setToken(token) {
    _loginToken = token;
  }
}

//API FOR LOGIN
class ApiLogin {
  Future<LoginModel> login({
    required String username,
    required String password,
  }) async {
    // Uri uri = Uri.https(Constant.baseUrl, '/jwt-auth/v1/token');
    Response _response = await post(
      Uri.parse(ConstUrl.baseUrl + '/jwt-auth/v1/token'),
      body: <String, dynamic>{
        'username': username,
        'password': password,
      },
    );
    if (_response.statusCode == 200) {
      final LoginModel responseData = LoginModel.fromJson(_response.body);
      return responseData;
    } else {
      throw Exception("Failed to login!");
    }
  }
}

class ApiArticle {
  static final List<ArticleModel> listPost = [];

  Future<List<ArticleModel>> getAllPost() async {
    final response = await get(Uri.parse(ConstUrl.baseUrl + "/wp/v2/posts"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      for (Map<String, dynamic> i in data) {
        listPost.add(ArticleModel.fromJson(i));
      }
      return listPost;
    } else {
      throw Exception("Failed to load Post");
    }
  }
}

class ApiSearch {
  static Future<List<SearchModel>> getData(String? article) async {
    Uri uri = Uri.parse(ConstUrl.baseUrl + "/wp/v2/search?search=$article");
    try {
      final response = await get(uri);
      if (200 == response.statusCode) {
        final List<SearchModel> search = searchModelFromJson(response.body);
        return search;
      } else {
        return List.empty();
      }
    } catch (e) {
      return List.empty();
    }
  }
}
