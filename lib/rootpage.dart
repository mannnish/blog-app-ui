import 'pages/addpost.dart';
import 'pages/home.dart';
import 'pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedIndex = 0;
  Widget _animatedContainer = HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false ,
      body: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        child: _animatedContainer,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: selectedIndex,
        showElevation: false, // use this to remove appBar's elevation
        backgroundColor: Colors.white,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
            switch (selectedIndex) {
              case 0:
                _animatedContainer = HomePage();
                break;
              case 1:
                _animatedContainer = AddPost();
                break;
              case 2:
                _animatedContainer = Profile();
                break;
              default:
                _animatedContainer = Text("NULL");
            }
          });
        },
        
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            inactiveColor: Colors.grey,
            activeColor: Color.fromRGBO(115, 218, 206, 1),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.add_circle),
            title: Text('Add'),
            inactiveColor: Colors.grey,
            activeColor: Color.fromRGBO(115, 218, 206, 1),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.data_usage),
            title: Text('Profile'),
            inactiveColor: Colors.grey,
            activeColor: Color.fromRGBO(115, 218, 206, 1),
          )
        ],
      ),
    );
  }
}
