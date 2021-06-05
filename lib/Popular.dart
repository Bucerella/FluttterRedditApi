import 'package:flutter/material.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Container(
          child: Image.network(
            'https://i4.hurimg.com/i/hurriyet/75/750x422/6014124cc9de3d5810819f47.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
