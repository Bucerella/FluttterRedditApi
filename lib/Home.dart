import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/RedditJsonBuilder.dart';

class Home extends StatefulWidget {
  final String kind;
  final String data;

  const Home({Key key, this.kind, this.data}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: jsonReddits(),
    );
  }
}
