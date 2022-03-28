import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 30.0,
);

const kWeatherDescriptionTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 20.0,
);


const kTextFieldInputBorderStyle = InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter City Name',
                      hintStyle: TextStyle(color: Colors.blueGrey),
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.white,
                      ));