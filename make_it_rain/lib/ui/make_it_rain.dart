import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MakeItRainState();
  }
}

class MakeItRainState extends State<MakeItRain> {
  int _moneyCounter = 0;
  MaterialColor _moneyColor = Colors.green;
  var _textAppear;

  void _rainMoney() {
    setState(() {
      _moneyCounter += 1;
      if (_moneyCounter == 22) {
        _moneyColor = Colors.orange;
        _textAppear = new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Los dos patitos",
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
                fontSize: 20.3
              ),
            ),
            new Icon(
              Icons.favorite,
              color: Colors.red,
            )
          ],
        );
      } else {
        _moneyColor = Colors.green;
        _textAppear = null;
      }
    });
  }

  void _resetMoney() {
    setState(() {
      _moneyCounter = 0;
      _moneyColor = Colors.green;
      _textAppear = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Make it Rain"),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: "Reset money",
        child: new Icon(Icons.settings_backup_restore),
        onPressed: _resetMoney,
      ),
      body: new Container(
        padding: new EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: new Column(
          children: <Widget>[
            new Center(
              child: new Text(
                "Get rich!",
                style: new TextStyle(
                  color: _moneyCounter == 22 ? Colors.redAccent : Colors.blue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            new Expanded(
              child: new Center(
                  child: new Text(
                '\$$_moneyCounter',
                style: new TextStyle(
                  color: _moneyColor,
                  fontSize: 46.9,
                ),
              )),
            ),
            new Expanded(
              child: new Center(child: _textAppear),
            ),
            new Expanded(
              child: new Center(
                child: new FlatButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    _rainMoney();
                  },
                  child: new Text(
                    "LET IT RAIN!",
                    style: new TextStyle(fontSize: 19.9),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
