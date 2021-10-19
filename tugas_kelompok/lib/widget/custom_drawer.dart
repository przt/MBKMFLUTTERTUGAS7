import 'package:flutter/material.dart';
import 'package:tugas_kelompok/colors_config.dart';
import 'package:tugas_kelompok/login_page.dart';
import 'package:tugas_kelompok/post_page.dart';
import 'package:tugas_kelompok/provider/all_provider.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<LoginProvider>(
          builder: (context, LoginProvider login, child) {
        bool isLogin = login.getToken();
        return ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Palette.backgroundColor,
              ),
              child: Text(
                'GITS Article',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostPage()),
                );
              },
            ),
            ListTile(
              leading: (isLogin)
                  ? const Icon(Icons.logout)
                  : const Icon(Icons.subdirectory_arrow_right_rounded),
              title: (isLogin)
                  ? const Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  : const Text(
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
        );
      }),
    );
  }
}
