import 'package:flutter/material.dart';
import 'package:tugas_kelompok/colors_config.dart';
import 'package:tugas_kelompok/model/search_model.dart';
import 'package:tugas_kelompok/provider/all_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class CardSearch extends StatelessWidget {
  final List<SearchModel>? searchModel;
  final String article;
  // final String linkUrl;

  const CardSearch({
    Key? key,
    required this.searchModel,
    required this.article,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    if (searchModel == null) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "Hasil untuk pencarian tidak ditemukan",
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
      );
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        SearchModel search = searchModel![index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(search.title.toString(),
                    style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(
                    height: 65,
                    child: Text("link: " + search.url.toString()),
                  ),

                ]),
          ),
        );
      },
      itemCount: searchModel!.length,
    );
  }
}