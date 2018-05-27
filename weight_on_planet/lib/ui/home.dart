import 'package:flutter/material.dart';
import 'dart:math' as math;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State<Home> {
  final _availableImages = {
    "moon": {"image": "images/001-moon.png", "name": "The Moon", "factor": 0.1},
    "jupiter": {
      "image": "images/002-jupiter.png",
      "name": "Jupiter",
      "factor": 2.34
    },
    "mars": {"image": "images/003-mars.png", "name": "Mars", "factor": 0.38},
    "ducks": {
      "image": "images/couple.png",
      "name": "Ducks"
    } // ignore this easter egg... (:
  };
  double _currentWeightOnEarth = 0.0;
  String _currentWeight = '0.0';
  String _currentImage = "images/001-moon.png";
  String _radioValue = "moon";
  String _radioValueName = "The Moon";

  TextEditingController _userWeightController = new TextEditingController();

  void _handleRadioValueChanged(String value) {
    setState(() {
      _radioValue = value;
      _calculateWeight(_currentWeightOnEarth);
      _calculateCurrentValues();
      _radioValueName = _availableImages[_radioValue]["name"];
    });
  }

  void _userWeightChanged(String value) {
    setState(() {
      _currentWeightOnEarth = double.parse(value);
      _calculateWeight(_currentWeightOnEarth);
      _calculateCurrentValues();
    });
  }

  void _calculateCurrentValues() {
    if (_currentWeightOnEarth == 22.0) {
      _currentImage = _availableImages["ducks"]["image"];
    } else {
      _currentImage = _availableImages[_radioValue]["image"];
      _radioValueName = _availableImages[_radioValue]["name"];
    }
  }

  String _calculateWeight(double value) {
    return _currentWeight =
        (value * _availableImages[_radioValue]["factor"]).toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        title: new Text("Planet Weight Machine"),
        backgroundColor: Colors.deepPurple.shade900,
        centerTitle: true,
      ),
      body: new Container(
        alignment: Alignment.center,
        decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [
          Colors.grey.shade900,
          Colors.deepPurple.shade900,
          Colors.blueGrey.shade900
        ])),
        child: new ListView(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: new Image.asset(
                _currentImage,
                height: 100.0,
                width: 240.0,
              ),
            ),
            new Center(
              child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(_radioValueName,
                style: new TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold
                ),),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: new Card(
                color: Colors.white,
                child: new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      new TextField(
                        controller: _userWeightController,
                        onChanged: _userWeightChanged,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          icon: new Icon(Icons.person_pin),
                          labelText: "Your weight on Earth (Kg)",
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Radio<String>(
                              activeColor: Colors.amber.shade200,
                              value: "moon",
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChanged,
                            ),
                            new Text(
                              _availableImages["moon"]["name"],
                              style: new TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54),
                            ),
                            new Radio<String>(
                              value: "jupiter",
                              activeColor: Colors.orange,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChanged,
                            ),
                            new Text(
                              _availableImages["jupiter"]["name"],
                              style: new TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54),
                            ),
                            new Radio<String>(
                              activeColor: Colors.red,
                              value: "mars",
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChanged,
                            ),
                            new Text(
                              _availableImages["mars"]["name"],
                              style: new TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: new Card(
                color: Colors.white,
                child: new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "Your weight on $_radioValueName is...",
                        style: new TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15.0,
                          color: Colors.black54,
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              _currentWeight.toString(),
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 40.0,
                                color: Colors.green.shade900,
                              ),
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: new Text(
                                "Kg",
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.0,
                                  color: Colors.green.shade800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
