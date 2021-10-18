import 'package:flutter/material.dart';
import 'package:tugas_kelompok/colors_config.dart';
import 'package:tugas_kelompok/login_page.dart';
import 'package:tugas_kelompok/model/article_model.dart';
import 'package:tugas_kelompok/api/api_service.dart';
import 'package:tugas_kelompok/provider/all_provider.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/widget/card_news.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Gits Article"),
        backgroundColor: Palette.backgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.search),
              onTap: () {
                Navigator.pushNamed(context, '/search_article');
              },
            ),
          ),
        ],
      ),
      body: Consumer<ArticleProvider>(
        builder: (context, provider, child) {
          if (provider.state == ResultState.Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.state == ResultState.HasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: provider.postResult.length,
              itemBuilder: (context, index) {
                var post = provider.postResult[index];
                return ArticleCard(articleModel: post);
              },
            );
          } else if (provider.state == ResultState.NoData) {
            return Center(
              child: Text(provider.message),
            );
          } else if (provider.state == ResultState.Error) {
            return Center(
              child: Text(provider.message),
            );
          } else {
            return const Center(child: Text(''));
          }
        },
      ),
      drawer: new Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Palette.backgroundColor,
              ),
              child: Text('GITS Article',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.subdirectory_arrow_right_rounded),
              title: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                // Update the state of the app
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
                // ...
                // Then close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
