import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:womansafety/profile.dart';
import 'package:womansafety/setting.dart';

import 'Chat.dart';
import 'feedback.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/Vector.svg',
              width: 24,
              height: 24,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset('assets/alarm.png'),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.3 * 0.5 - 30,
                  left: MediaQuery.of(context).size.width * 0.5 - 12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '15',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 3),
                      Icon(
                        Icons.phone,
                        size: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                _buildDashboardButton('Rescue 1122', Icons.local_hospital),
                _buildDashboardButton('CyberCrime 1991', Icons.warning),
                _buildDashboardButton('Motorway Police 130', Icons.location_on),
                _buildDashboardButton('Live Chat', Icons.chat),
              ],
            ),
          ),
        ],
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
            icon: Icons.palette,  // This uses the "palette" icon for theme
            text: 'Theme',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
          GButton(
            icon: Icons.feedback,
            text: 'Feedback',
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
            if (_currentIndex == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              );
            }
            if (_currentIndex == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Setting(),
                ),
              );
            }
            if (_currentIndex == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => feedback(),
                ),
              );
            }
          });
        },
      ),
    );
  }

  Widget _buildDashboardButton(String text, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (text == 'Live Chat') {
          // Navigate to ChatScreen only for the "Live Chat" button
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatPage()),
          );
        }
        // Handle other buttons if needed
      },
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }


}
