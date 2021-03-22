import 'package:flutter/material.dart';
import 'package:decago_test/Services/appservices.dart';
import 'package:decago_test/CsvBody/csvBodyList.dart';

class SearchItem extends SearchDelegate<String> {
  List<List<dynamic>> Carcsv;
  List<List<dynamic>> CarcsvSugest;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    CsvData.loadCsv().then((value) => Carcsv = value);
    CarcsvSugest = query.isEmpty
        ? Carcsv
        : CarcsvSugest.where((element) => Carcsv.contains(query)).toList();
    return CsvBody(
      Carcsv: CarcsvSugest,
    );
  }
}
