import 'package:decago_test/Models/CarModel.dart';
import 'package:decago_test/Services/App_Services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'cardBody.dart';

class Car extends StatefulWidget {
  @override
  _CarState createState() => _CarState();
}

class _CarState extends State<Car> {
  final String url = "https://android-json-test-api.herokuapp.com/accounts";
  var data;
  List colorsall = [];
  List countries = [];
  int i;
  List<dynamic> c;
  List<Carmodels> cars;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchedData();
    // fetchall();
  }

  // fetchall() async {
  //   var res = await http.get(url);
  //   data = jsonDecode(res.body);
  //   Carmodels carmodels = new Carmodels.fromJson(data);
  // }

  FetchedData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    Services.getCars().then((value) {
      cars = value;
      print(cars[1].colors);
    });

    setState(() {});

    data.forEach((element) {
      colorsall.add(element["colors"]);
      countries.add(element["countries"]);

      // print(colorsall.toString());
      // print(countries.toString());
    });

    for (int x = 0; x < data.length; x++) {
      // print(x);
      for (i = 0; i < data[x]["countries"].length; i++) {
        c = data[x]["countries"];
        //print(c);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: null == cars.length ? 0 : cars.length,
      itemBuilder: (context, index) {
        Carmodels card = cars[index];
        return ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Date:   ${card.createdAt}"),
              Text("Gender: ${card.gender}"),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(card.fullName),
                ],
              ),
              Wrap(
                children: [
                  Text(
                    card.countries.toString().isEmpty
                        ? "no data"
                        : card.countries.toString(),
                    overflow: TextOverflow.ellipsis,
                  )
                  //Text(countries[index])
                ],
              ),
              Wrap(
                children: [
                  Text(
                    card.colors.toString(),
                    overflow: TextOverflow.ellipsis,
                  )
                  //Text(countries[index])
                ],
              )
            ],
          ),
          leading: Image.network(card.avatar),
        );
      },
    );
  }
}

//
