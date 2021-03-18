import 'package:flutter/material.dart';

class CsvBody extends StatelessWidget {
  CsvBody({
    Key key,
    this.Carcsv,
  }) : super(key: key);

  final List<List<dynamic>> Carcsv;

  @override
  Widget build(BuildContext context) {
    try {
      if (Carcsv != null && Carcsv.length > 0) {
        return ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                title: Wrap(
                  children: [
                    Text(Carcsv[index][0].toString()),
                    SizedBox(
                      width: 20,
                    ),
                    Text(Carcsv[index][1]),
                    SizedBox(
                      width: 20,
                    ),
                    Text(Carcsv[index][2]),
                    SizedBox(
                      width: 20,
                    ),
                    Text(Carcsv[index][3]),
                    SizedBox(
                      width: 20,
                    ),
                    Text(Carcsv[index][4]),
                    SizedBox(
                      width: 20,
                    ),
                    Text(Carcsv[index][5]),
                    SizedBox(
                      width: 20,
                    ),
                    Text(Carcsv[index][6].toString()),
                  ],
                ),
              );
            });
      } else {
        return Text("Loading please wait");
      }
    } catch (e) {
      print(e);
    }
  }
}
