import 'package:flutter/material.dart';
import 'package:mxpertz_test/Widgets/message_tile.dart';


class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
          color: Color.fromRGBO(248, 206, 88, 1)
        ),
        height: 80,width: double.infinity,
        child: Row(
          children: [
            SizedBox(width: 10,),
            Icon(Icons.arrow_back_ios_outlined),
            SizedBox(width: 10,),
            Image.asset('assets/girl.png'),
            SizedBox(width: 10,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Erikacarwford_34',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              Text('11:30 PM',style: TextStyle(color: Colors.grey),)
            ],)
          ],
        ),
      ),
      
    ],));
  }
}