import 'package:flutter/material.dart';
import 'package:quiz/pages/data.dart';
import 'package:quiz/pages/detail.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: ((context, index) {
            final Data datadata = data[index];
            return Card(
              color: Colors.green[100],
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detail(dataDetail: datadata),
                      ));
                },
                leading: Image(
                  height: 50,
                  width: 75,
                  image: AssetImage(datadata.imageUrl),
                  fit: BoxFit.cover,
                ),
                title: Text(
                  datadata.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  datadata.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
