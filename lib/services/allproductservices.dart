import 'dart:convert';

import 'package:apitask/modelclass/allproductmodel.dart';
import 'package:apitask/constants/endpoints.dart' as constant;
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Allproductservices {
  /* static Future<List<Allproductsmodel>> getAllproducts() async {
    try{
    var url = '${constant.domain}${constant.getAll}';
    print(url);

    var uri = Uri.parse(url);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

     // List<Map<String,dynamic>>  res = jsonResponse.map<Map<String,dynamic>>((e)=>e as Map<String,dynamic>).toList();
     var data = jsonResponse.map((e) {


        Allproductsmodel model = Allproductsmodel.fromJson(e);
        print(model.id == 20);

        return 'hi';



      });

      print(data);

       // var allProductList = jsonResponse.map<Allproductsmodel>((e) => Allproductsmodel.fromJson(e));
       // print(allProductList);












      return [];
    }
    else{

      throw Exception('failed to load');
    }

    }
    catch(e){
      throw Exception('Error $e');
    }
  }
*/
  static Future<dynamic> getAllproducts() async {
    try {
      var url = '${constant.domain}${constant.getAll}';
      print(url);

      var uri = Uri.parse(url);
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var data = jsonResponse.map<Allproductsmodel>((e) {
          return Allproductsmodel.fromJson(e);
        }).toList();

        return data;
      } else {
        throw Exception('failed to load');
      }
    } catch (e) {
      throw Exception('Error $e');
    }
  }
}
