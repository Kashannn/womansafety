import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'Dashboard.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'My Current Location',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 20),
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                color: Colors.green,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Other Help Center',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 20),
                    Icon(
                      Icons.handshake_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                color: Colors.orange,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Location Review',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 20),
                    Icon(
                      Icons.search_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GNav(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          rippleColor: Color(0xFF272256),
          hoverColor: Color(0xFF272256),
          gap: 8,
          activeColor: Colors.white,
          iconSize: 24,
          duration: Duration(milliseconds: 400),
          tabBackgroundColor: Colors.blue,
          backgroundColor: Color(0xFF272256),
          color: Colors.blue,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.chat,
              text: 'Chat',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
            GButton(
              icon: Icons.notifications,
              text: 'Notification',
            ),
          ],
          selectedIndex: _currentIndex,
          onTabChange: (index) {
            setState(() {
              _currentIndex = index;

              // Use Navigator to navigate to different screens
              if (_currentIndex == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Dashboard(),
                  ),
                );

              }
              if (_currentIndex == 1) {

              }
              if (_currentIndex == 2) {


              }
              if (_currentIndex == 3) {

              }

            });
          }),
    );
  }
}
