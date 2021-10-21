import 'package:flutter/cupertino.dart';
import 'package:tugas_kelompok/api/api_service.dart';
import 'package:tugas_kelompok/model/article_model.dart';
import 'package:tugas_kelompok/model/login_model.dart';
import 'package:tugas_kelompok/model/search_model.dart';

enum ResultState { Loading, NoData, HasData, Error }

//article provider
class ArticleProvider extends ChangeNotifier {
  final ApiArticle? apiPost;

  ArticleProvider({required this.apiPost}) {
    _fetchAllArticle();
  }

  List<ArticleModel>? _articleModel;
  String _message = "";
  ResultState? _state;

  String get message => _message;
  List<ArticleModel> get postResult => _articleModel!;
  ResultState get state => _state!;

  Future<dynamic> _fetchAllArticle() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final post = await apiPost!.getAllPost();
      if (post.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = "Data is empty";
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _articleModel = post;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = "Error to get data from API";
    }
  }
}

//login provider
class LoginProvider extends ChangeNotifier {
  LoginProvider({required this.apiLogin});

  final ApiLogin? apiLogin;
  final constant = ConstUrl();

  Future<void> getLogin(String username, String password) async {
    LoginModel loginResult = await apiLogin!.login(
      username: username,
      password: password,
    );
    constant.setToken(loginResult.token);
    notifyListeners();
  }

  bool getToken() {
    if (constant.token != '') {
      return true;
    } else {
      return false;
    }
  }

  void logout() {
    constant.setToken('');
    notifyListeners();
  }
}

//Search Provider
// class SearchProvider extends ChangeNotifier {
//   final ApiSearch? apiSearch;

//   SearchProvider({required this.apiSearch}) {
//     _fetchSearchPost();
//   }

//   List<SearchModel>? _searchModel;
//   String _message = "";
//   ResultState? _state;
//   String article = '';

//   String get message => _message;
//   List<SearchModel> get postResult => _searchModel!;
//   ResultState get state => _state!;

//   void setName(String value) {
//     article = value;
//     notifyListeners();
//     _fetchSearchPost();
//   }

//   Future<dynamic> _fetchSearchPost() async {
//     try {
//       _state = ResultState.Loading;
//       notifyListeners();
//       final post = await apiSearch!.getData(article);
//       if (post.isEmpty) {
//         _state = ResultState.NoData;
//         notifyListeners();
//         return _message = "Data is empty";
//       } else {
//         _state = ResultState.HasData;
//         notifyListeners();
//         return _searchModel = post;
//       }
//     } catch (e) {
//       _state = ResultState.Error;
//       notifyListeners();
//       return _message = "Error to get data from API";
//     }
//   }
// }
