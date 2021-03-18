import 'package:csv/csv.dart';
import 'package:decago_test/Models/CarModel.dart';
import 'package:decago_test/Services/App_Services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'cardBody.dart';

class Car extends StatefulWidget {
  @override
  _CarState createState() => _CarState();
}

class _CarState extends State<Car> {
  final String url = "https://android-json-test-api.herokuapp.com/accounts";
  List<Carmodels> cars;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchedData();
    // loadCsv();
  }

  FetchedData() async {
    await Services.getCars().then((value) {
      cars = value;

      // print(cars.length);
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (cars != null && cars.length > 0) {
      return ListView.builder(
        itemCount: cars.length,
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
                      card.countries.toString(),
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
            leading: Image.network(
              card.avatar,
            ),
          );
        },
      );
    } else {
      return Text("loading");
    }
  }
}

//
