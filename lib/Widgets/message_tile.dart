import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  final String messageContent;
  final String timeStamp;

  const MessageTile({
    required this.messageContent,
    required this.timeStamp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color:Colors.yellow,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        children: [
          Text(messageContent),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Text(timeStamp),
            SizedBox(width: 10,),
            Image.asset('assets/dot.png',height: 20,)
          ],)
        ],
      ),
    );
  }
}