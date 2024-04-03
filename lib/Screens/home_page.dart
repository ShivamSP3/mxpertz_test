import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
     body: SafeArea(
       child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),height: 50,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/plus.png'),
                // SizedBox(width: 50,),
                Image.asset('assets/skenu.png'),
                // SizedBox(width: 50,),
                Image.asset('assets/msg.png'),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 60,
              width: double.infinity,
              child: Row(children: [
                SizedBox(width: 10,),
                Stack(children: [
                  Image.asset('assets/girl.png',height: 60,),
                  Positioned(
                    bottom: 1,right: 1,
                    child: Image.asset('assets/circle.png',height: 20,color: Colors.yellow,)),
                 Positioned(
                    bottom: 1,right: 1,child: Image.asset('assets/plus.png',height: 20,))
       
                ],),
                SizedBox(width: 10,),
                Stack(children: [
                  Image.asset('assets/circle.png',height: 60,),
                  Image.asset('assets/girl.png',height: 60,)
                ],),
                SizedBox(width: 10,),
       
                 Stack(children: [
                  Image.asset('assets/circle.png',height: 60,),
                  Image.asset('assets/girl.png',height: 60,)
                ],), 
                SizedBox(width: 10,),
                Stack(children: [
                  Image.asset('assets/circle.png',height: 60,),
                  Image.asset('assets/girl.png',height: 60,)
                ],),
       
              ],),
            )
            ,SizedBox(height: 10,),
            Container(
              height: height*0.5,width: width,
              child: Image.asset('assets/girl55.png',fit: BoxFit.contain,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                Image.asset('assets/heart.png',height: 40,),
                Image.asset('assets/comment.png',height: 40,),
                Image.asset('assets/share.png',height: 40,),
       
                  ],
                ),
                Image.asset('assets/save.png',height: 40,),
       
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(children: [
                SizedBox(width: 10,),
              Image.asset('assets/girl.png',height: 30,),
              SizedBox(width: 10,),
              Text('Add a comment...',style: TextStyle(fontSize: 16),)
              ],),
               Row(children: [
              Image.asset('assets/Union.png',height: 25,),
              SizedBox(width: 5,),
              Image.asset('assets/victory 1.png',height: 25,),
              SizedBox(width: 5,),
              Image.asset('assets/Ellipse 29.png',height: 25,),
       
       
              ],),
            ],),
          
                Text('   June 18',style: TextStyle(fontSize: 12),),
            
          
             Container(
              height: height*0.5,width: width,
              child: Image.asset('assets/girl55.png',fit: BoxFit.contain,),
            ),

             
          ],
         ),
       ),
     ),
    );
  }
}