import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class CsvData {
  static Future<List<dynamic>> loadCsv() async {
    List<List<dynamic>> csvdatas = [];
    final rawdata = await rootBundle.loadString("cardata/CarData.csv");
    List<List<dynamic>> csvdata = CsvToListConverter().convert(rawdata);
    if (csvdata != null) {
      return csvdatas = csvdata;
    }

    // print(csvdatas.length);
  }
}
