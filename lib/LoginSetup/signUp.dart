import 'package:flutter/material.dart';
import 'package:group_ass/LoginSetup/signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  String _email, _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/book.jpg'),
                fit: BoxFit.cover,
              ),
              color: Color.fromRGBO(255, 255, 255, 0.19),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(50.0),
                  child: Form(
                      key: _formKey,
                      child: Column(children: <Widget>[
                        TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Enter email';
                            }
                          },
                          onSaved: (input) => _email = input,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white70,
                            labelText: 'Email',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.purple[900], width: 3.0)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (input) {
                            if (input.length < 6) {
                              return 'Your password needs to be at least 6 characters';
                            }
                          },
                          onSaved: (input) => _password = input,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white70,
                              labelText: 'Password',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.purple[900],
                                width: 3.0,
                              ))),
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton(
                          onPressed: signUp,
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                          color: Colors.purple[700],
                        )
                      ])),
                )
              ],
            )));
  }

  void signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        User user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: _email, password: _password))
            .user;
        user.sendEmailVerification();
        Navigator.of(context).pop();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
