import 'package:flutter/material.dart';
import 'package:mxpertz_test/Screens/comment_screen.dart';
import 'package:mxpertz_test/Screens/home_page.dart';
import 'package:mxpertz_test/Screens/message_screen.dart';
import 'package:mxpertz_test/Screens/profile_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _pageTitles = [
    HomePage(),
    Center(child: Text('Likes'),),
    MessageScreen(),
    CommentScreen(),
    ProfileScreen(uid: '123',),

  ];
  static const List<String> _assetPaths = [
    'assets/home.png',
    'assets/heart.png',
    'assets/share.png',
    'assets/comment.png',
    'assets/person.png',

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: _pageTitles[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: Colors.yellow),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
          
            icon: Image.asset(
              _assetPaths[0],
              width: 30,
              height: 30,
            ),label: ''
           
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _assetPaths[1],
              width: 30,
              height: 30,
            ),label: ''
            
          ),
           BottomNavigationBarItem(
            icon: Image.asset(
              _assetPaths[2],
              width: 30,
              height: 30,
            ),
            label: ''
          ), BottomNavigationBarItem(
            icon: Image.asset(
              _assetPaths[3],
              width: 30,
              height: 30,
            ),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _assetPaths[4],
              width: 30,
              height: 30,
            ),label: ''
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
