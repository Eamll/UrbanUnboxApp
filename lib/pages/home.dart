import 'package:flutter/material.dart';
import 'package:notjusthack_app/components/appbar.dart';
import 'package:notjusthack_app/pages/businesses.dart';
import 'package:notjusthack_app/pages/create_post.dart';
import 'package:notjusthack_app/pages/messages.dart';
import 'package:notjusthack_app/pages/product_swiper.dart';
import 'package:notjusthack_app/pages/profile.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ProductSwiper(),
    Businesses(),
    CreatePost(),
    Messages(),
    Profile(
      profileImagePath: 'assets/images/logo.png',
      username: 'User12312312',
      businessName: 'MakeBoxesCompany',
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const CustomAppBar()),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Businesses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        onTap: _onItemTapped,
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
