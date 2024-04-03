import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
   final String uid;
  const ProfileScreen({super.key, required this.uid});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;
  var userData = {};


   @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();

      var postSnap = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
userData = userSnap.data()!;
     
      setState(() {});
    } catch (e) {
      print(
        
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return  isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        :  Scaffold(
      appBar: AppBar(
        leading:
            IconButton(icon: Icon(Icons.arrow_back_ios_sharp), onPressed: null),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [Image.asset('assets/menu.png')],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(120),
                ),
                height: height * 0.15,
                width: height * 0.15,
                child: Center(
                    child: Image.asset(
                  'assets/girl.png',
                  height: height * 0.14,
                  fit: BoxFit.fill,
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Following'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('0'),
                      SizedBox(height: 40,)
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Followers'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('0'),
                      SizedBox(height: 40,)

                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Post'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('0'),
                      SizedBox(height: 40,)

                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 40,
              ),
              Text(
                'Jane Doe',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () => null,
            child: Container(
              height: 60,
              width: width * 0.9,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  color: Color.fromRGBO(1, 29, 69, 1)),
              child:
                  Text('Edit Profile', style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              // Image.asset('assets/video.png',height: 50,),
              // Image.asset('assets/lock.png'),
              // Image.asset('assets/likey.png'),

            ],
          ),
          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Container(
              height: 100,width: 100,
              decoration: BoxDecoration(color: Colors.grey,
              borderRadius: BorderRadius.circular(10)
              ),
            ),
            Container(
              height: 100,width: 100,
              decoration: BoxDecoration(color: Colors.grey,
              borderRadius: BorderRadius.circular(10)
              ),
            ),
            Container(
              height: 100,width: 100,
              decoration: BoxDecoration(color: Colors.grey,
              borderRadius: BorderRadius.circular(10)
              ),
            )
          ],) ,
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Container(
              height: 100,width: 100,
              decoration: BoxDecoration(color: Colors.grey,
              borderRadius: BorderRadius.circular(10)
              ),
            ),
            Container(
              height: 100,width: 100,
              decoration: BoxDecoration(color: Colors.grey,
              borderRadius: BorderRadius.circular(10)
              ),
            ),
            Container(
              height: 100,width: 100,
              decoration: BoxDecoration(color: Colors.grey,
              borderRadius: BorderRadius.circular(10)
              ),
            )
          ],) 
        ],
      ),
    );
  }
}
