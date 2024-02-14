
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/apiservies/apiservies.dart'; // Ensure this path matches your project structure
import 'package:flutter_application_1/models/news%20model.dart'; // Ensure this path matches your project structure
import 'package:flutter_application_1/wedgit/news_buble.dart';
import 'package:flutter_application_1/wedgit/newsappbartype.dart'; // Ensure this path matches your project structure

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Future<List<newsmodel>> _newsArticles = ApiEvent(dio: Dio()).getCurrentNews();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            Row(
              children: [
                newasappbartybe(name: 'genral', color: Colors.grey),
                 newasappbartybe(name: 'sport', color: Colors.grey),
              ],
            ),
             
            Expanded(
              child: FutureBuilder<List<newsmodel>>(
                future: _newsArticles,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error fetching news: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          var article = snapshot.data![index];
                          return news_buble(
                              img: article.imgUrl, title: article.title, description: article.description);
                        });
                  } else {
                    return Center(child: Text('No news found'));
                  }
                },
              ),
            ),
          ],
        ));
  }
}
