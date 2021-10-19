import 'package:flutter/material.dart';
import 'package:tugas_kelompok/api/api_service.dart';
import 'package:tugas_kelompok/colors_config.dart';
import 'package:tugas_kelompok/login_page.dart';
import 'package:tugas_kelompok/main_page.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/post_page.dart';
import 'package:tugas_kelompok/provider/all_provider.dart';
import 'package:tugas_kelompok/search_page.dart';
import 'package:tugas_kelompok/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ArticleProvider(
            apiPost: ApiArticle(),
          ),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => LoginProvider(
            apiLogin: ApiLogin(),
          ),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => SearchProvider(
            apiSearch: ApiSearch(),
          ),
        ),
      ],
      builder: (
        BuildContext context,
        Widget? child,
      ) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/splash_screen',
          routes: {
            '/splash_screen': (context) => const SplashScreen(),
            '/article_list': (context) => const PostPage(),
            '/login_page': (context) => const LoginPage(),
            '/search_article': (context) => const SearchPage(),
          },
        );
      },
    );
  }
}
