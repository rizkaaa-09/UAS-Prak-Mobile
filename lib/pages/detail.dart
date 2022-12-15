import 'package:flutter/material.dart';
import 'package:quiz/pages/data.dart';

class Detail extends StatelessWidget {
  const Detail({
    Key? key,
    required this.dataDetail,
  }) : super(key: key);

  final Data dataDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true, 
          title: Text('Details')),
        body: ListView(
          children: [
            Image(
                image: AssetImage(dataDetail.imageUrl),
                width: 600,
                fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.justify,
                    dataDetail.name,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    textAlign: TextAlign.justify,
                    dataDetail.description,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
