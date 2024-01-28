import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        //background image
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Contact Us',
                style: TextStyle(
                  color: Colors.pink[300],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Developer 1\nDeveloper 2',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 40),
              Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/contact.svg',
                  height: 250,
                  width: 150,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
