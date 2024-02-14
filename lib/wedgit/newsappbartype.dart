import 'package:flutter/material.dart';
class newasappbartybe extends StatelessWidget {
  const newasappbartybe({super.key,required this.name, required this.color});
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 300,
        alignment: Alignment.center,
        child: Text(name,style: TextStyle(fontSize: 30,color: Colors.white),),
        color: color,
        margin: EdgeInsets.only(top: 20),
      ),
    );
  }
}