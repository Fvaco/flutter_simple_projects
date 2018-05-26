import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LoginState();
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomeString = "";

  void _clear() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }

  void _showWelcome() {
    setState(() {
      if (_userController.text.isNotEmpty
          && _passwordController.text.isNotEmpty) {
        _welcomeString = _userController.text;
      } else {
        _welcomeString = "Nothing!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: new Container(
        padding: new EdgeInsets.only(top: 20.0),
        alignment: Alignment.center,
        child: new Column(
          children: <Widget>[
            new Image.asset(
              "images/login_image.png",
              height: 100.0,
              width: 240.0,
              fit: BoxFit.scaleDown,
            ),
            new Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Card(
                color: Colors.white,
                elevation: 2.0,
                child: new Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Center(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "Login",
                            style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.blueGrey.shade800),
                          ),
                        ),
                        new TextField(
                          controller: _userController,
                          autofocus: true,
                          decoration: new InputDecoration(
                              hintText: 'Username',
                              icon: new Icon(Icons.person)),
                        ),
                        new TextField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: new InputDecoration(
                              hintText: 'Password', icon: new Icon(Icons.lock)),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[

                              new FlatButton(
                                onPressed: _clear,
                                child: new Text("Clear",
                                    style: new TextStyle(color: Colors.red)),
                              ),
                              new RaisedButton(
                                onPressed: _showWelcome,
                                color: Colors.green,
                                child: new Text("LOGIN",
                                    style: new TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            new Text(
              "Welcome $_welcomeString!",
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0
              ),
            ),
          ],
        ),
      ),
    );
  }
}
