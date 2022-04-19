import 'package:ecommerceappproject/control/API/ecommercecategoriesapi.dart';
import 'package:ecommerceappproject/view/screens/cartscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import 'homepage.dart';
import 'loginscreen.dart';
class CategoriesScreen extends StatefulWidget {


  @override
  State<CategoriesScreen> createState() => _CategoriesScreen();
}

class _CategoriesScreen extends State<CategoriesScreen> {

  //  List<String> categories = ["general","clothes","TV","Sneakers","Cream","Home needs","Mobile Phone","food"];
  getuser() {
    var authStateChanges = FirebaseAuth.instance.currentUser;
    print(authStateChanges!.email);
  }

  @override
  void initState() {
    getuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          backgroundColor: blue,
          leading:IconButton(onPressed: (){
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) {
              return MyHomePage();
            }));
          },icon:Icon(Icons.home),),


          actions: [
            IconButton(onPressed: () {
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) {
                return CategoriesScreen();
              } ));
            }, icon:Icon(Icons.category,)),
            IconButton(onPressed: () {
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) {
                return CartScreen();
              }));
            }, icon:Icon(Icons.shopping_cart,)),
            IconButton(onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (BuildContext context) {
                return LoginScreen();
              }));
            }, icon: Icon(Icons.exit_to_app),


            )
          ],
        ),
        body: Consumer<EcommerceCategory>(
            builder:(context, value, child) =>GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5,crossAxisSpacing: 5),itemCount:value.categories.length,itemBuilder: (context,index)=>GridTile(
              child: Image.network(value.categories[index].avatar,fit: BoxFit.cover,),
              footer: Container(

                alignment: Alignment.center,
                color: Colors.blue,child: Column(
                crossAxisAlignment:CrossAxisAlignment.center ,
                children:[

                  Text(value.categories[index].name),

                ],
              ),
                padding: EdgeInsets.symmetric(vertical: 5),

              ),
            )
            )
        )
    );
  }
}
