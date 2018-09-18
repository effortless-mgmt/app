import "package:flutter/material.dart";

class UserPage extends MaterialPageRoute<Null> {
  UserPage(String user)
      : super(builder: (BuildContext ctx) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(ctx).canvasColor,
                elevation: 1.0,
                title: Text("Hello " + user),
              ),
              body: Center(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: Text("Go back."),
                ),
              ));
        });
}
