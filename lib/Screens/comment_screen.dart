import 'package:flutter/material.dart';
import 'package:mxpertz_test/Widgets/comment_tile.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
      var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
          foregroundColor: Color.fromRGBO(248, 206, 88, 1),
          backgroundColor: Color.fromRGBO(248, 206, 88, 1),
          elevation: 0,
          title: Text(
            'Comment',
            style: TextStyle(color: Colors.black),
          ),actions: [Image.asset('assets/chat-badge.png'),SizedBox(width: width*0.45,)],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
        body: Column(
          children: [
            CommentTile(),
            CommentTile(),
            CommentTile(),

          ],
        ),
    );
  }
}