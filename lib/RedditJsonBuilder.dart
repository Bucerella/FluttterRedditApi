import 'package:flutter/material.dart';
import 'package:reddit_clone/SpecialListTile.dart';
import 'package:reddit_clone/api/reddit_api.dart';

Widget jsonReddits() {
  return FutureBuilder(
      future: getReddits(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var verilerMap = snapshot.data;
          print(verilerMap);
          return ListView.separated(
            itemCount: verilerMap.length,
            itemBuilder: (context, index) {
              String title = snapshot.data[index]['data']['title'];
              String desc =
                  snapshot.data[index]['data']['description'];
              int comments =
                  snapshot.data[index]['data']['num_comments'];
              String img = snapshot.data[index]['data']['thumbnail'];
              return SpecialListTile(
                title,
                desc,
                comments,
                img,
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey,
                thickness: 1,
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Color(0xffFF5700),
            ),
          );
        }
      });
}
