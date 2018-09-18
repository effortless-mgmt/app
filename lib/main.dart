import "package:flutter/material.dart";
import "LoginPage.dart";

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: LoginPage(), theme: ThemeData(primarySwatch: Colors.blue));
  }
}
