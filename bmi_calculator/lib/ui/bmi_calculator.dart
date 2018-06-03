import 'package:flutter/material.dart';
import 'dart:math' as math;

class BMICalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new BMICalculatorState();
}

class BMICalculatorState extends State<BMICalculator> {
  var _dataRanges = [
    {
      "resultText": "Obese",
      "resultDescription": "Value over 30",
      "resultColor": Colors.red,
      "max": null,
      "min": 30.0,
    },
    {
      "resultText": "Overweight",
      "resultDescription": "Value between 25 and 30",
      "resultColor": Colors.amber,
      "min": 25.0,
      "max": 30.0,
    },
    {
      "resultText": "Healthy",
      "resultDescription": "Value between 18.5 and 24.9",
      "resultColor": Colors.green,
      "min": 18.5,
      "max": 24.9,
    },
    {
      "resultText": "Underweight",
      "resultDescription": "Value under 18.5",
      "resultColor": Colors.blue,
      "max": 18.5,
      "min": 0,
    }
  ];
  Widget _resultWidget = new Text("Enter valid values");

  TextEditingController _ageController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();
  TextEditingController _heightController = new TextEditingController();

  double _calculateResult() {
    double age;
    double weight;
    double height;
    double result;
    if (_ageController.text.isEmpty ||
        _heightController.text.isEmpty ||
        _weightController.text.isEmpty) return null;

    age = double.parse(_ageController.text);
    weight = double.parse(_weightController.text);
    height = double.parse(_heightController.text);

    result = (weight / math.pow((height / 100), 2));
    debugPrint(result.toString());
    return result;
  }

  Widget _getResultWidget() {
    var result;
    double value = _calculateResult();
    if (value != null) {
      for (var data in _dataRanges) {
        if (value >= data["min"]) {
          if (data["max"] == null) {
            result = data;
          } else {
            if (value <= data["max"]) {
              result = data;
            }
          }
        }
        if (result != null) {
          return new Column(
            children: <Widget>[
              new Text(
                value.toStringAsFixed(2),
                style: new TextStyle(
                    color: data["resultColor"],
                    fontWeight: FontWeight.w600,
                    fontSize: 30.0),
              ),
              new Text(
                data["resultText"],
                style: new TextStyle(
                    color: data["resultColor"],
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: new Text(
                  data["resultDescription"],
                  style: new TextStyle(
                      color: Colors.black45,
                      fontSize: 15.0),
                ),
              ),
            ],
          );
        }
      }
    }

    return new Text("Enter valid values");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: new Text("BMI Calculator"),
      ),
      body: new Container(
        alignment: Alignment.center,
        color: Colors.grey.shade200,
        child: new ListView(
          children: <Widget>[
            new BMIStyledCard(
              <Widget>[
                new TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      icon: new Icon(Icons.access_time), labelText: "Your age"),
                ),
                new TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    icon: new Icon(Icons.accessibility_new),
                    labelText: "Your weight in Kg",
                  ),
                ),
                new TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      icon: new Icon(Icons.straighten),
                      labelText: "Yout height in cm"),
                )
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 20.0,left: 50.0, right: 50.0),
              child: new RaisedButton(
                color: Colors.blue,
                textColor: Colors.blue.shade50,
                child: new Text("CALCULATE"),
                onPressed: () {
                  setState(() {
                    _resultWidget = _getResultWidget();
                  });
                },
              ),
            ),
            new BMIStyledCard(
              <Widget>[_resultWidget],
            ),
          ],
        ),
      ),
    );
  }
}

class BMIStyledCard extends StatelessWidget {
  final List<Widget> children;

  BMIStyledCard(this.children);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        elevation: 2.0,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0),
        ),
        child: new Padding(
          padding: const EdgeInsets.all(20.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: this.children,
          ),
        ),
      ),
    );
  }
}
