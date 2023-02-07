import 'dart:convert';

import 'package:ecommarceassign/model/search_product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductSearchApi{
  List<Products> searchProductList = [];
  Future<List<Products>> fetchApiData()async{
    try{
      var link = "https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=rice";
      var responce = await http.get(Uri.parse(link));
     print("responce is ${responce.body}");
      var data = jsonDecode(responce.body);
      print("aaaaaaaaaaaaaaaaaaaaaaaaa ${data["products"]["results"][0].length}");
      Products products;
      //for(var i in data["products"]["results"]){
      //   products = Products.fromJson(i);
      //   searchProductList.add(products);
     // }
    }catch(e){
        print("The problem is $e");
    }
    return searchProductList;
  }

}
