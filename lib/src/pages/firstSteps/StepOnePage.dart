import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'StepTwoPage.dart';

class StepOnePage extends StatefulWidget {
  @override
  _StepOnePageState createState() => _StepOnePageState();
}

class _StepOnePageState extends State<StepOnePage> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 150,
                      child: Image.asset("images/logos/basketFood.png")),
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magn.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "SUIVANT",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => StepTwoPage())
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  startTime() async {
    var duration = new Duration(milliseconds: 100);
    return new Timer(duration, action);
  }

  action() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(36.0),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Autorisation de localisation",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Image.asset("images/logos/localisationLogo.png"),
                      ),
                    ),
                    Text(
                      "Activez les services de localisation afin d'exploiter l'application de façon efficace. ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: RaisedButton(
                        color: Colors.orange,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "PARTAGER MA POSITION",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          await _getCurrentLocation();
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Plus tard",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<void> _getCurrentLocation() async {
    final position  = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('lat', position.latitude);
    await prefs.setDouble('long', position.longitude);
  }
}
