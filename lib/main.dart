import "package:flutter/material.dart";
import "LoginPage.dart";

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new LoginPage(),
        theme: new ThemeData(primarySwatch: Colors.blue));
  }
}

// class LoginPage extends StatefulWidget {
//   @override
//   State createState() => new LoginPageState();
// }

// class LoginPageState extends State<LoginPage>
//     with SingleTickerProviderStateMixin {
//   AnimationController _iconAnimationController;
//   Animation<double> _iconAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _iconAnimationController = new AnimationController(
//       duration: new Duration(milliseconds: 500),
//       vsync: this,
//     );

//     _iconAnimation = new CurvedAnimation(
//         parent: _iconAnimationController, curve: Curves.easeIn);

//     _iconAnimation.addListener(() => this.setState(() {}));
//     _iconAnimationController.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         backgroundColor: Colors.white,
//         body: new Stack(
//           fit: StackFit.expand,
//           children: <Widget>[
//             new Image(
//               image: new AssetImage("assets/fly3.jpg"),
//               fit: BoxFit.cover,
//               height: double.infinity, //Force full-screen
//               width: double.infinity,
//               color: Colors.black54,
//               colorBlendMode: BlendMode.srcOver,
//             ),
//             new Column(mainAxisAlignment: MainAxisAlignment.center, children: <
//                 Widget>[
//               new FlutterLogo(
//                 size: _iconAnimation.value * 100,
                
//               ),
//               new Form(
//                   child: new Theme(
//                 data: new ThemeData(
//                     brightness: Brightness.dark,
//                     inputDecorationTheme: new InputDecorationTheme(
//                         hintStyle: new TextStyle(
//                             color: Colors.white, fontSize: 15.0))),
//                 child: Container(
//                   padding: const EdgeInsets.all(45.0),
//                   child: new Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       new Container(
//                         height: 36.0,
//                         child: new TextFormField(
//                         decoration: new InputDecoration(
//                           border: new OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius:
//                                   new BorderRadius.all(Radius.circular(25.0))),
//                           fillColor: Colors.white.withOpacity(0.2),
//                           filled: true,
//                           hintText: "Enter Username",
//                         ),
//                         keyboardType: TextInputType.text,
//                       ),
//                       ),
//                       new Padding(
//                         padding: const EdgeInsets.only(top: 30.0),
//                       ),
//                       new Container(
//                         height: 36.0,
//                         child:
//                       new TextFormField(
//                         decoration: new InputDecoration(
//                           border: new OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius:
//                                   new BorderRadius.all(Radius.circular(25.0))),
//                           fillColor: Colors.white.withOpacity(0.2),
//                           filled: true,
//                           hintText: "Enter Password",
//                         ),
//                         keyboardType: TextInputType.text,
//                         obscureText: true,
//                       ),
//                       ),
//                       new Padding(
//                         padding: const EdgeInsets.only(top: 30.0),
//                       ),
//                       new RaisedButton(
//                           color: Colors.white,
//                           shape: new RoundedRectangleBorder(
//                               borderRadius: new BorderRadius.circular(15.0)),
//                           textColor: Colors.black,
//                           child: new Text("Login"),
//                           onPressed: () => {}),
//                     ],
//                   ),
//                 ),
//               ))
//             ])
//           ],
//         ));
//   }
// }


