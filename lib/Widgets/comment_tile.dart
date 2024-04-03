import 'package:flutter/material.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 10,),
          Expanded(
            flex: 1,
            child: Image.asset(
                  'assets/p3.png',
                  fit: BoxFit.contain,height: 140,
                
              
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            flex: 3,
            child: Column(
                children: [
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      Text(
                        'ronaldferguson',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset('assets/dot.png'),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        '5min ago',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                        'Lorem Ipsum is simply dummy text .Lorem Ipsum',
                      ),
                        Text(
                        'of the printing and typesetting industry',
                      ),  

                  ],
                 )
                ],
              ),
          ),SizedBox(width: 10,)
          
        ],
      ),
    );
  }
}
