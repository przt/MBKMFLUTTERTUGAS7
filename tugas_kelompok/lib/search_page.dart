import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      appBar: AppBar(
        backgroundColor: Palette.backgroundColor,
        title: const Text("Search"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(30.0),
              child: Form(
                child: Consumer<SearchProvider>(
                    builder: (context, provider, child) {
                  return Column(
                    children: [
                      TextFormField(
                        controller: _searchController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Searching',
                          suffixStyle: TextStyle(color: Colors.grey),
                          suffixIcon: IconButton(
                            onPressed: () {
                              provider.setName(_searchController.text);
                            },
                            icon: Icon(
                              Icons.search,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: _buildList(provider),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  _buildList(SearchProvider provider) {
    if (provider.state == ResultState.Loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (provider.state == ResultState.HasData) {
      return _searchController.text.isEmpty
          ? Center(
              child: Text("Search Article"),
            )
          : _postCard(provider.postResult);
    } else if (provider.state == ResultState.NoData) {
      return Center(
        child: Text(provider.message),
      );
    } else if (provider.state == ResultState.Error) {
      return Center(
        child: Text(provider.message),
      );
    } else {
      return Center(
        child: Text(""),
      );
    }
  }

  Widget _postCard(List<SearchModel> postResult) {
    return Column(
        children: postResult
            .map(
              (e) => Padding(
                padding: EdgeInsets.only(top: 8),
                child: Container(
                  width: double.infinity,
                  child: CardSearch(searchModel: e),
                ),
              ),
            )
            .toList());
  }
}
