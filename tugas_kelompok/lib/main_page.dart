import 'package:flutter/material.dart';
import 'package:tugas_kelompok/colors_config.dart';
import 'package:tugas_kelompok/widget/card_news.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
      ),
      body: Container(
        child: CardNews(),
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
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
