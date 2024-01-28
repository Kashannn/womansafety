import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutApplication extends StatefulWidget {
  const AboutApplication({super.key});

  @override
  State<AboutApplication> createState() => _AboutApplicationState();
}

class _AboutApplicationState extends State<AboutApplication> {
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
                'About Application',
                style: TextStyle(
                  color: Colors.pink[300],
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0), // Adjust the horizontal padding as needed
                  child: Text(
                    'FemSecure360: Empowering Women Safety with IoTFemSecure360 is a cutting-edge initiative dedicated to enhancing women safety through innovative technology. This comprehensive solution integrates a mobile application with a smart wearable device to provide unparalleled safety features ensuring peace of mind for women in various situations FemSecure360 is not just a safety application it a commitment to empowering women by providing them with the tools they need to navigate the world confidently. Stay safe, stay empowered with FemSecure360',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
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
