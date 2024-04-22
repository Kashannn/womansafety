import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Dashboard.dart';
import 'Regestration.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('User Not Found'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('User not found. Would you like to sign up?'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Sign Up'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Registration(),
                      ),
                    );
                  },
                ),
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Wrong password provided for that user.'),
        ));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Login Here',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 40),
                  DecoratedTextField(
                    hintText: 'Email',
                    prefixIcon: Icons.email_sharp,
                    isEmailField: true,
                    controller: emailController,
                  ),
                  SizedBox(height: 30),
                  DecoratedTextField(
                    hintText: 'Password',
                    prefixIcon: Icons.lock,
                    obscureText: true,
                    controller: passwordController,
                  ),
                  SizedBox(height: 70),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[300],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DecoratedTextField extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final bool isEmailField;
  final TextEditingController? controller;

  const DecoratedTextField({
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.isEmailField = false,
    this.controller,
  });

  @override
  _DecoratedTextFieldState createState() => _DecoratedTextFieldState();
}

class _DecoratedTextFieldState extends State<DecoratedTextField> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      style: TextStyle(color: isFocused ? Colors.black : Colors.white),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle:
        TextStyle(color: isFocused ? Colors.black54 : Colors.white54),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: isFocused ? Colors.black : Colors.white,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white), // White border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white), // White border color
        ),
      ),
      onChanged: (value) {
        setState(() {
          isFocused = value.isNotEmpty;
        });
      },
      onTap: () {
        setState(() {
          isFocused = true;
        });
      },
      onEditingComplete: () {
        setState(() {
          isFocused = false;
        });
      },
    );
  }
}
