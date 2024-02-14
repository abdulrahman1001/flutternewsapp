import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class news_buble extends StatelessWidget {
  const news_buble({super.key, required this.img, required this.title, required this.description});
  final String img;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Image.network(img),
      Text(title, style: TextStyle(fontSize: 100,color: Colors.amber),),
      Text(description, style: TextStyle(fontSize:30)),
      Text("--------------------------------"*10)
      ],
    );
  }
}
