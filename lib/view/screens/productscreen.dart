import 'package:ecommerceappproject/view/screens/cartscreen.dart';
import 'package:ecommerceappproject/view/screens/loginscreen.dart';
import 'package:ecommerceappproject/widgets/cartcounter.dart';
import 'package:flip_card/flip_card.dart';
import'package:flutter/material.dart';
import'dart:math'as math ;
import 'dart:ui'as ui;

import '../../../constant.dart';
import 'categoriesscreen.dart';
import 'homepage.dart';
class ProductScreen extends StatefulWidget {
  String name;
  String title;
  num price;
  num discount;
  String currency;
  String avatar;
  num price_final;
  String price_final_text;



  @override
  _ProductScreen createState() => _ProductScreen();

  ProductScreen({

    required this.name,
    required this.title,
    required this.price,
    required  this.discount,
    required  this.currency,
    required  this.avatar,
    required  this.price_final,
    required  this.price_final_text,


  });
}

class _ProductScreen extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {




    return Scaffold(
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
            } ));
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
      body: Stack(
        fit:StackFit.expand,
        children: [
          Transform(transform: Matrix4.rotationY(math.pi),alignment: Alignment.center,
            child: Image.network(widget.avatar),),
          BackdropFilter(
            filter:ui.ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
            child: Container(
              color: Colors.red.withOpacity(0.2),


            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                /*  SizedBox(
                    height:MediaQuery.of(context).size.height/24,

                  ),*/
                 /* Container(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(onPressed: (){
                        Navigator.pop(context);
                      }, icon:Icon(Icons.arrow_back_ios,size:25,color:Colors.white), label:Text("${widget.name}",style:TextStyle(
                        color:Colors.black,fontSize:20,
                        fontWeight: FontWeight.w800,
                      )),
                      )
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height/50,

                  ),*/
                  FlipCard(
                    fill:Fill.fillBack,
                    front:Container(
                      height: MediaQuery.of(context).size.height/1.6,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                          image: DecorationImage(image: NetworkImage(
                              widget.avatar
                          ),fit:BoxFit.fill

                          )
                      ),
                    ), back:Container(
                    height: MediaQuery.of(context).size.height/1.6,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                        image: DecorationImage(image: NetworkImage(
                            widget.avatar
                        ),
                            fit:BoxFit.fill

                        )
                    ),
                  ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${widget.title}",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                      Text(
                            "${widget.name}",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
                       Row(mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                           children:[

                         Text("${widget.price_final_text}",style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold)),
                             CartCounter()


          ]),
           SizedBox(height:10),
                      Container(
                        width: MediaQuery.of(context).size.width/1.5,
                        color: Colors.redAccent,
                        alignment: Alignment.center,
                        child: FlatButton(

                            onPressed: (){}, child:Text("Add to Cart",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,backgroundColor: Colors.redAccent))),
                      ),






                    ],
                  ),


          SizedBox(
                    height:MediaQuery.of(context).size.height/10,

                  ),



                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton:FloatingActionButton.extended(onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
          return LoginScreen();
        }));
      }, elevation: 10,
          backgroundColor: black,
          autofocus: true,
          label:Text("Thanks for your visitor",style: TextStyle(
              fontSize: 16
          ),
          )
      ) ,
    );
  }
}
