import 'dart:convert';

import 'package:http/http.dart' as http;
import '../constants/endpoints.dart' as constant;

class Services {
  static Future<List<dynamic>> getCategories() async {
    var url = '${constant.domain}${constant.getCategories}';
    print(url);
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);

      return jsonResponse;
    } else {
      throw Exception('failed to load products');
    }
  }
}
