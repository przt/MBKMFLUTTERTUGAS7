import 'package:flutter/material.dart';
import 'package:tugas_kelompok/colors_config.dart';
import 'package:tugas_kelompok/model/article_model.dart';
import 'package:tugas_kelompok/provider/all_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';

class ArticleCard extends StatelessWidget {
  final ArticleModel articleModel;

  const ArticleCard({Key? key, required this.articleModel}) : super(key: key);

  _urlLaunchUrl() async {
    var url = articleModel.link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleProvider>(builder: (context, provider, child) {
      return FutureBuilder(builder: (context, snapshot) {
        return Material(
            color: Palette.backgroundColor,
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
                  title: Text(
                    articleModel.title.rendered,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: SizedBox(
                    height: 65,
                    child: Html(
                      data: articleModel.excerpt.rendered,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.keyboard_arrow_right),
                    onPressed: () => _urlLaunchUrl(),
                  ),
                ),
                const Divider(),
              ],
            ));
      });
    });
  }
}
