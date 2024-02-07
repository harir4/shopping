import 'dart:convert';

import 'package:apitask/constants/endpoints.dart' as constant;
import 'package:apitask/modelclass/electronicsmodel.dart';
import 'package:http/http.dart' as http;

class Electronicservices {
  static Future<List<Electronicsmodel>> getElectronics() async {
    var url = '${constant.domain}${constant.getElectronics}';
    print(url);
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    print(response);
    if (response.statusCode == 200) {
      List<Electronicsmodel> jsonResponse = jsonDecode(response.body)
          .map((e) => Electronicsmodel.fromJson(e))
          .toList();
      print(jsonResponse);

      return jsonResponse;
    } else {
      throw Exception('failed to load');
    }
  }
}
