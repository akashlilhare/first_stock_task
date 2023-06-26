import 'dart:convert';
import 'package:flutter/services.dart';

class DataHelper {
  Future<String> _loadJSONData() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    return jsonString;
  }

   Future<dynamic> loadData() async {
    String jsonString = await _loadJSONData();
    final jsonData = json.decode(jsonString);
    print(jsonData);
    return jsonData;
  }
}
