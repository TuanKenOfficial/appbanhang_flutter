import 'package:flutter/material.dart';

class SingleCategory extends StatelessWidget {
  final String name;
  final String image;
  const SingleCategory({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 220,
        width: 150,
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/images/$image")),
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
