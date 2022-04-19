import 'package:ecommerceappproject/control/API/ecommerceproductsapi.dart';
import 'package:ecommerceappproject/widgets/cartcounter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import 'categoriesscreen.dart';
import 'homepage.dart';
import 'loginscreen.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        body: Consumer<EcommerceProduct>(
            builder: (context, value, child) =>
        ListView(
        children: [
        for(int i = 0; i <value.products.length; i++)
     Card(
      elevation:1,
      shadowColor:Colors.white,
      color:white,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:[
            Container(
              height:200,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: (value.products[i].avatar=="null")?NetworkImage("https://bitsofco.de/content/images/2018/12/broken-1.png"):NetworkImage("${value.products[i].avatar}")
                  )
              ),
            ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("${value.products[i].title}"),
                      Text("${value.products[i].name}"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${value.products[i].price_final_text}"),
                          CartCounter(),



                        ],
                      )
                    ],
                  ),
                )


              ]
            ),
          ),
  ]
    )
    ),
      SizedBox(height: 20),
      Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          
          Container(
            width:MediaQuery.of(context).size.width/2.5,
             child: ElevatedButton(onPressed:(){} ,child: Text("Clear Cart"),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,onPrimary: Colors.red
              ),),
            ),

        
          Container(
            width: MediaQuery.of(context).size.width/2.5,
             child: ElevatedButton(onPressed:(){} ,child: Text("Go to CheckOut"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,onPrimary: Colors.red
                ),),
            ),

        ],
      )

    ],

        )
          )
    );
    
  }
}


    /*  GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                      return ProductScreen(name:value.products[index].name, title:value.products[index].title, price:value.products[index].price, discount:value.products[index].discount, currency:value.products[index].currency, avatar:value.products[index].avatar, price_final:value.products[index].price_final, price_final_text:value.products[index].price_final_text);
                    }));
                  },
    child: Card(
    elevation: 5,
    shadowColor: black,
    color:white,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25)
    ),
    child:Column(
    children: [
    Container(
    height:200,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.only(topLeft:Radius.circular(25),topRight: Radius.circular(25)),
    image: DecorationImage(
    fit: BoxFit.cover,
    image: (NetworkImageCard=="null")?NetworkImage("https://bitsofco.de/content/images/2018/12/broken-1.png"):NetworkImage("${NetworkImageCard}")
    )
    ),
    ),
    Container(
    width:MediaQuery.of(context).size.width*0.90,
    alignment: Alignment.center,
    child: Text("$textCardCategories",style:TextStyle(color:textColor),textAlign: TextAlign.center,),
    ),
    Container(

    child:Row(
    children: [
    IconButton(onPressed: (){
    Fun.shareLink(LinkNews);
    }, icon:Icon(Icons.share)),
    IconButton(onPressed: (){
    Fun.copyLink(LinkNews);
    }, icon:Icon(Icons.copy_rounded)),
    ],
    )
    )
    ],
    ) ,
    ),


     ListView.builder(
         itemBuilder: (BuildContext context, int index) {
           return Consumer<EcommerceProduct>(
             builder: (context, value, child) =>
                 ListView(
                   children: [
                     for(int i = 0; i < value.products.length; i++)
                       Container(
                         margin: EdgeInsets.symmetric(
                             horizontal: 2.5, vertical: 5),
                         child: Card(
                           color: Colors.grey,
                           elevation: 6,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Expanded(
                                 child: Container(
                                   width: MediaQuery
                                       .of(context)
                                       .size
                                       .width,
                                   height: 50,
                                   child: (value.products[i].avatar == null)
                                       ? Image(image: AssetImage(
                                       'assets/news-default.jpeg'),)
                                       :
                                   Image.network(value.products[i].avatar)
                                   ,
                                 ),
                               ),
                               SizedBox(width: 5,),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Text((value.products[i].name.length > 40)
                                       ? "${value.products[i].title.substring(
                                       0, 40)}..."
                                       : value.products[i].title),
                                   SizedBox(height: 10),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment
                                         .spaceBetween,
                                     children: [

                                       Text("${value.products[i]
                                           .price_final_text}",
                                         style: TextStyle(fontSize: 15,
                                             color: Colors.black54),

                                       ),
                                       CartCounter()
                                     ],
                                   ),
                                   Container(
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment
                                           .start,
                                       children: [
                                         ElevatedButton(
                                           onPressed: () {},
                                           child: Text(
                                             "Clear Cart", style: TextStyle(
                                               fontSize: 20
                                           ),),

                                           style: ElevatedButton.styleFrom(
                                               primary: Colors.white,
                                               onPrimary: Colors.red),
                                         ),
                                         ElevatedButton(
                                           onPressed: () {},
                                           child: Text(
                                             "Go to Checkout", style: TextStyle(
                                               fontSize: 20
                                           ),),

                                           style: ElevatedButton.styleFrom(
                                               primary: Colors.white,
                                               onPrimary: Colors.red),
                                         )
                                       ],
                                     ),
                                   )

                                 ],)
                             ],
                           ),
                         ),
                       ),


                   ],
                 ),

           );
         }

  ));
  }
}


child: Card(
elevation: 5,
shadowColor: black,
color:white,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(25)
),
child:Column(
children: [
Container(
height:200,
decoration: BoxDecoration(
borderRadius: BorderRadius.only(topLeft:Radius.circular(25),topRight: Radius.circular(25)),
image: DecorationImage(
fit: BoxFit.cover,
image: (NetworkImageCard=="null")?NetworkImage("https://bitsofco.de/content/images/2018/12/broken-1.png"):NetworkImage("${NetworkImageCard}")
)
),
),
Container(
width:MediaQuery.of(context).size.width*0.90,
alignment: Alignment.center,
child: Text("$textCardCategories",style:TextStyle(color:textColor),textAlign: TextAlign.center,),
),
Container(

child:Row(
children: [
IconButton(onPressed: (){
Fun.shareLink(LinkNews);
}, icon:Icon(Icons.share)),
IconButton(onPressed: (){
Fun.copyLink(LinkNews);
}, icon:Icon(Icons.copy_rounded)),
],
)
)
],
) ,
),

*/