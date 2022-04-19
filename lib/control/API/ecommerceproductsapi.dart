import 'dart:convert';
import'package:http/http.dart'as http ;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../models/Ecommerceproductmodel.dart';
class EcommerceProduct with ChangeNotifier {
  EcommerceProduct() {
    getAllData();
  }




  String selectedCategory = "general";
  //Dio dio = Dio();
  List<Product>products = [];


  changeCategory(String category){
    selectedCategory = category;
    getAllData();
    notifyListeners();
  }
   getAllData() async {
     products = [];

     try {
       String APIKEY = "b3983e7c5c37445bbeef37eaef5974b6";
       var url = Uri.parse(
           "https://retail.amit-learning.com/api/products?api_key=$APIKEY&language=en-US&page=1");
       print(url);
       var response = await http.get(url);
       var responsebody = jsonDecode(response.body)["products"];
       print(responsebody);
       for (int i = 0; i <responsebody.length; i++) {
         products.add(Product.fromMap(responsebody[i]));
       }

     notifyListeners();
     print(products);

   }
    catch (e) {
      print("e$e");
    }

 }
  notifyListeners();
}

