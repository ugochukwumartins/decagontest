import 'package:decago_test/CsvBody/SearchBar.dart';
import 'package:decago_test/CsvBody/csvBodyList.dart';
import 'package:flutter/material.dart';
import 'package:decago_test/Services/appservices.dart';

class SecondRoute extends StatefulWidget {
  @override
  _SecondRoute createState() => _SecondRoute();
}

class _SecondRoute extends State<SecondRoute> {
  List<List<dynamic>> Carcsv;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadCsv();
    // loadCsv();
  }

  LoadCsv() async {
    await CsvData.loadCsv().then((value) => Carcsv = value);

    setState(() {});
    print(Carcsv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CsvAppBar(context),
        body: CsvBody(
          Carcsv: Carcsv,
        ) ////
        );
  }
}

AppBar CsvAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.blue,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      color: Colors.black,
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Center(
      child: Text(
        "Car App CSV",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        color: Colors.black,
        onPressed: () {
          showSearch(context: context, delegate: SearchItem());
        },
      ),
    ],
  );
}
