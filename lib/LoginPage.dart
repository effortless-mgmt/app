import "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();

    _iconAnimationController = new AnimationController(
      duration: new Duration(milliseconds: 500),
      vsync: this,
    );

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeIn);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Stack(fit: StackFit.expand, children: <Widget>[
          new Image(
            image: new AssetImage("assets/fly3.jpg"),
            fit: BoxFit.cover,
            height: double.infinity, //Force full-screen
            width: double.infinity,
            color: Colors.black54,
            colorBlendMode: BlendMode.srcOver,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new LoginForm(),
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
// our Form.
class _LoginFormState extends State<LoginForm> {
  // Create a text controller. We will use it to retrieve the current value
  // of the TextField!
  final unController = TextEditingController();
  final pwController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    unController.dispose();
    pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Form(
      child: new Theme(
        data: new ThemeData(
            brightness: Brightness.dark,
            inputDecorationTheme: new InputDecorationTheme(
                hintStyle: new TextStyle(color: Colors.white, fontSize: 15.0))),
        child: Container(
          padding: const EdgeInsets.all(45.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                height: 36.0,
                child: new TextFormField(
                  controller: unController,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            new BorderRadius.all(Radius.circular(25.0))),
                    fillColor: Colors.white.withOpacity(0.2),
                    filled: true,
                    hintText: "Enter Username",
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 30.0),
              ),
              new Container(
                height: 36.0,
                child: new TextFormField(
                  controller: pwController,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            new BorderRadius.all(Radius.circular(25.0))),
                    fillColor: Colors.white.withOpacity(0.2),
                    filled: true,
                    hintText: "Enter Password",
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 30.0),
              ),
              new RaisedButton(
                  color: Colors.white,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0)),
                  textColor: Colors.black,
                  child: new Text("Login"),
                  onPressed: () {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("Username: " +
                                unController.text +
                                "\nPassword: " +
                                pwController.text),
                          );
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}