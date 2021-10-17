import 'package:flutter/material.dart';
import 'package:tugas_kelompok/colors_config.dart';

class CardNews extends StatefulWidget {
  const CardNews({Key? key}) : super(key: key);

  @override
  _CardNewsState createState() => _CardNewsState();
}

class _CardNewsState extends State<CardNews> {
  @override
  Widget build(BuildContext context) {
    return Card(  
      child: Container(
        height: 210,
        width: 310,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 100,
                spreadRadius: 5,
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Title",
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 26,
                  fontWeight: FontWeight.w200,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "content",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
