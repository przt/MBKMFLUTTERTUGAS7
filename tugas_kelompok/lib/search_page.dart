import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/api/api_service.dart';
import 'package:tugas_kelompok/colors_config.dart';
import 'package:tugas_kelompok/login_page.dart';
import 'package:tugas_kelompok/model/search_model.dart';
import 'package:tugas_kelompok/post_page.dart';
import 'package:tugas_kelompok/provider/all_provider.dart';
import 'package:tugas_kelompok/widget/card_search.dart';
import 'package:tugas_kelompok/widget/custom_drawer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<SearchModel>? _search;
  bool _onSearch = false;
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      appBar: AppBar(
        backgroundColor: Palette.backgroundColor,
        title: TextField(
          controller: _searchController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Ketik Disini',
            suffixIcon: IconButton(
              onPressed: _searchPost,
              icon: const Icon(Icons.search),
            ),
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          autofocus: true,
          onEditingComplete: _searchPost,
        ),
      ),
      body: _body(),
      drawer: CustomDrawer(),
    );
  }

  Future<void> _searchPost() async {
    setState(() {
      _onSearch = true;
    });
    _search = await ApiSearch.getData(_searchController.text);
    setState(() {
      _onSearch = false;
    });
  }

  Widget _body() {
    if (_onSearch) {
      return Center(
        child: Column(
          children: const <Widget>[
            Text("Cari Keyword Postingan"),
            CircularProgressIndicator(),
          ],
        ),
      );
    } else {
      return CardSearch(searchModel: _search, article: _searchController.text);
    }
  }
}