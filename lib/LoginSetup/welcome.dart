import 'package:flutter/material.dart';
import 'package:group_ass/LoginSetup/signIn.dart';
import 'package:group_ass/LoginSetup/signUp.dart';
import 'package:flutter/src/services/asset_bundle.dart';
import 'package:flutter/src/painting/image_provider.dart';

class WelcomePage extends StatefulWidget {
  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bookshelf.jpg'), fit: BoxFit.cover),
        color: Color.fromRGBO(255, 255, 255, 0.19),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200.0,
            height: 100.0,
            padding: EdgeInsets.all(20.0),
            child: RaisedButton(
              onPressed: NavigateToSignIn,
              child: Text('Sign in',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20)),
              color: Colors.cyan[800],
            ),
          ),
          Container(
            width: 200.0,
            height: 100.0,
            padding: EdgeInsets.all(20.0),
            child: RaisedButton(
              onPressed: NavigateToSignUp,
              child: Text('Sign up',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20)),
              color: Colors.cyan[800],
            ),
          )
        ],
      ),
    );
  }

  void NavigateToSignIn() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void NavigateToSignUp() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SignUpPage(), fullscreenDialog: true));
  }
}
