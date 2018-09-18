import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_app/APIController.dart';
import 'package:flutter_app/UserPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();

    _iconAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _iconAnimation =
        CurvedAnimation(parent: _iconAnimationController, curve: Curves.easeIn);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(fit: StackFit.expand, children: <Widget>[
          Image(
            image: AssetImage("assets/fly3.jpg"),
            fit: BoxFit.cover,
            height: double.infinity, //Force full-screen
            width: double.infinity,
            color: Colors.black54,
            colorBlendMode: BlendMode.srcOver,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              LoginForm(),
            ],
          ),
        ]));
  }
}

// Define a Custom Form Widget
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

// Define a corresponding State class. This class will hold the data related to
// the Form.
class _LoginFormState extends State<LoginForm> {
  // Create a text controller. We will use it to retrieve the current value
  // of the TextField!
  final unController = TextEditingController();
  final pwController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String username;
  String password;

  final ThemeData themeData = ThemeData(
    brightness: Brightness.dark,
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white, fontSize: 15.0)),
  );

  TextFormField loginFormField(String s, bool obs) {
    return TextFormField(
      controller: obs ? pwController : unController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.white)),
        fillColor: Colors.white.withOpacity(0.2),
        filled: true,
        hintText: s,
      ),
      keyboardType: TextInputType.text,
      obscureText: obs,
      validator: (value) {
        if (value.isEmpty) {
          return obs
              ? 'Please enter your password'
              : 'Please enter your username';
        }
      },
    );
  }

  ButtonTheme loginButton() {
    return ButtonTheme(
        minWidth: 300.0,
        height: 50.0,
        child: RaisedButton(
            color: Colors.green.withOpacity(0.8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            textColor: Colors.white,
            child: Text("Login"),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                this.username = unController.text;
                this.password = pwController.text;
                // if (await APIController.verifyUser(username, password)) {
                //   showDialog(
                //       context: context,
                //       builder: (context) {
                //         return AlertDialog(
                //           content: Text("Logged in as " + username),
                //         );
                //       });
                // } else {
                //   showDialog(
                //       context: context,
                //       builder: (context) {
                //         return AlertDialog(
                //           content: Text("Username and/or password incorrect."),
                //         );
                //       });
                // }
                Navigator.push(context, UserPage(username));
              }
            }));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    unController.dispose();
    pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Theme(
        data: themeData,
        child: Container(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 45.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 30.0, child: loginFormField("Enter Username", false)),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
              ),
              Container(
                height: 30.0,
                child: loginFormField("Enter Password", true),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
              ),
              loginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
