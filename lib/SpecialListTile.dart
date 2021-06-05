import 'package:flutter/material.dart';

class SpecialListTile extends StatelessWidget {
  String title;
  String description;
  String img;
  int comments;

  SpecialListTile( this.title, this.description,
      this.comments, this.img);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        this.title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        this.description ?? "-",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          child: Text(
                        this.comments.toString() + "  Comments",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.grey),
                      )))
                ],
              ),
            ),
          ),
          Container(
            width: 80,
            height: 80,
            child: Image.network(
              this.img,
              errorBuilder: (
                BuildContext context,
                Object exception,
                StackTrace stackTrace,
              ) {
                return Container(
                  child: Image.network(
                    'https://i4.hurimg.com/i/hurriyet/75/750x422/6014124cc9de3d5810819f47.png',
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
