import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'Car_Body.dart';

class CarBody extends StatefulWidget {
  @override
  _CarBodyState createState() => _CarBodyState();
}

class _CarBodyState extends State<CarBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {},
        ),
        title: Center(
          child: Text(
            "Car App",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: () {},
          ),
          SizedBox(
            width: 20.0,
          )
        ],
      ),
      body: Car(),
    );
  }
}
