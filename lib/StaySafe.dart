import 'package:flutter/material.dart';

class StaySafe extends StatefulWidget {
  const StaySafe({super.key});

  @override
  State<StaySafe> createState() => _StaySafeState();
}

class _StaySafeState extends State<StaySafe> {
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
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Tips for Women on Staying Safe!',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Be Alert! Scan the area as you walk Avoid shopping alone. Try to shop with a friend or relative. Know your surroundings. Carry your purse close to your body and do not leave it unattended. Try not to carry too many packages',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )));
  }
}
