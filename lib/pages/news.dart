import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List _get = [];

  var apikey = '2df2babb943d45c4ba5cd08e1e4b83d2';

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=${apikey}"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          _get = data['articles'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //menghilangkan debug label
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: ListView.builder(
        itemCount: _get.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: ListTile(
              leading: Image.network(
                _get[index]['urlToImage'] ??
                    "https://www.exporthub.id/wp-content/uploads/2022/02/Inilah-Jenis-jenis-Sayuran-dari-yang-Sehat-Hingga-yang-Lolos-Ekspor.jpg",
                fit: BoxFit.cover,
                width: 100,
              ),
              title: Text(
                _get[index]['title'] ?? "No Title",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                _get[index]['description'] ?? "No Description",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
      )),
    );
  }
}
