import 'dart:convert';
import 'package:ecommerceappproject/models/ecommercecategorymodel.dart';
import'package:http/http.dart'as http ;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../models/Ecommerceproductmodel.dart';
class EcommerceCategory with ChangeNotifier {
  EcommerceCategory() {
    getAllData();
  }




  String selectedCategory = "general";
  //Dio dio = Dio();
  List<Category>categories = [];


  changeCategory(String category){
    selectedCategory = category;
    getAllData();
    notifyListeners();
  }
  getAllData() async {
    categories = [];

    try {
      String APIKEY = "b3983e7c5c37445bbeef37eaef5974b6";
      var url = Uri.parse(
          "https://retail.amit-learning.com/api/categories?api_key=$APIKEY&language=en-US&page=1");
      print(url);
      var response = await http.get(url);
      var responsebody = jsonDecode(response.body)["categories"];
      print(responsebody);
      for (int i = 0; i <responsebody.length; i++) {
        categories.add(Category.fromMap(responsebody[i]));
      }

      notifyListeners();
      print(categories);

    }
    catch (e) {
      print("e$e");
    }

  }
  notifyListeners();
}

