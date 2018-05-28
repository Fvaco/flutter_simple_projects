import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new BMICalculatorState();
}

class BMICalculatorState extends State<BMICalculator> {
  TextEditingController _ageController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();
  TextEditingController _heightController = new TextEditingController();

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
        color: Colors.grey.shade300,
        child: new ListView(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Card(
                  color: Colors.white,
                  elevation: 2.0,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0)),
                  child: new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new TextField(
                          controller: _ageController,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                              icon: new Icon(Icons.access_time),
                              labelText: "Your age"),
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
                  )),
            )
          ],
        ),
      ),
    );
  }
}
