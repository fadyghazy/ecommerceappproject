import 'package:ecommerceappproject/control/API/ecommerceproductsapi.dart';
import 'package:ecommerceappproject/view/screens/cartscreen.dart';
import 'package:ecommerceappproject/view/screens/productscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import 'categoriesscreen.dart';
import 'loginscreen.dart';
class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
        body: Consumer<EcommerceProduct>(
        builder:(context, value, child) =>GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5,crossAxisSpacing: 5),itemCount:value.products.length,itemBuilder: (context,index)=>
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                  return ProductScreen(name:value.products[index].name, title:value.products[index].title, price:value.products[index].price, discount:value.products[index].discount, currency:value.products[index].currency, avatar:value.products[index].avatar, price_final:value.products[index].price_final, price_final_text:value.products[index].price_final_text);
                }));
              },
              child: Card(
          child: GridTile(
          child: Image.network(value.products[index].avatar,fit: BoxFit.cover,),
              footer: Container(

                alignment: Alignment.center,
                color: Colors.blue,child: Column(
                crossAxisAlignment:CrossAxisAlignment.start ,
                children:[

                  Text(value.products[index].name),
                  Text(value.products[index].title,style: TextStyle(fontSize: 10,color: Colors.black),),

                  Container(
                    height: 30,
                    child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:[
                         ElevatedButton(

                             onPressed:(){}, child:Icon(Icons.add),style: ElevatedButton.styleFrom(primary: Colors.red),),
                    Text(value.products[index].price_final_text)
              ]),
                  ),
                ],
              ),
                padding: EdgeInsets.symmetric(vertical: 5),

              ),
    ),
        ),
            )
    )
    )
    );
  }
}

   /*   Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
       Consumer<EcommerceProvider>(
          builder:(context, value, child) =>  SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*.8,
            child: ListView(
              children: [
                for(int i = 0 ; i < value.products.length ; i++)
    StaggeredGridView.countBuilder(
    crossAxisCount:2,
    itemCount:value.products.length ,
    itemBuilder:(BuildContext context ,int itemIndex) {
    return GestureDetector(
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return ProductScreen(name:value.products[i].name,avatar:value.products[i].avatar,price:value.products[i].price,
    discount:value.products[i].discount,currency:value.products[i].currency
    ,price_final:value.products[i].price_final
    ,price_final_text:value.products[i].price_final_text, title:value.products[i].title);
    }));
    },
    child: Card(
    color: black,
    child: Padding(
    padding: const EdgeInsets.all(5.0),
    child: Column(
    children: [
    Image.network(value.products[itemIndex].avatar),
    Card(
    child: Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(5),

    child:Text((value.products[itemIndex].title
    ),
    style:const TextStyle(fontWeight: FontWeight.bold,color:Colors.white),),
    color: black
    )



    )

    ],
    ),
    ),
    ),
    );

    },
    staggeredTileBuilder: (int index) =>
    new StaggeredTile.fit(1)
    )
    ]
    )
    )
    )
    ]

    )
    );







}
}





    }, options:
              CarouselOptions(autoPlay: true,aspectRatio: 1.5,viewportFraction: 0.7,
                  height: MediaQuery.of(context).size.height/3,
                  initialPage: 0
                  ,reverse: false,
                  autoPlayInterval: const Duration(
                      seconds: 3
                  )
                  ,enableInfiniteScroll:
                  false,
                  autoPlayAnimationDuration: const Duration(
                    microseconds: 300,

                  ),
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal),
              );
            },),
          Expanded(
                child:Consumer(builder: (context, watch, child) {

                  return Padding(
                      padding: const EdgeInsets.all(5),
                      child:StaggeredGridView.countBuilder(
                          crossAxisCount:2,
                          itemCount:viewmodelpopular.listDataModel.length ,
                          itemBuilder:(BuildContext context ,int itemIndex) {
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                  return DisScreen(poster_path:viewmodelpopular.listDataModel[itemIndex].poster_path, title:viewmodelpopular.listDataModel[itemIndex].title,id:viewmodelpopular.listDataModel[itemIndex].id,backdrop_path:viewmodelpopular.listDataModel[itemIndex].poster_path, overview:viewmodelpopular.listDataModel[itemIndex].overview, vote_average:viewmodelpopular.listDataModel[itemIndex].vote_average ,original_title:viewmodelpopular.listDataModel[itemIndex].original_title,);
                                }));
                              },
                              child: Card(
                                color: white,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Image.network(image_url+viewmodelpopular.listDataModel[itemIndex].poster_path),
                                      Card(
                                          child: Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(5),

                                              child:Text((viewmodelpopular.listDataModel[itemIndex].title
                                              ),
                                                style:const TextStyle(fontWeight: FontWeight.bold,color:Colors.white),),
                                              color: black
                                          )



                                      )

                                    ],
                                  ),
                                ),
                              ),
                            );

                          },
                          staggeredTileBuilder: (int index) =>
                          new StaggeredTile.fit(1)
                      )
                  );


                },

                )
            )
          ],
        )
    );
  }
}



  Expanded(
          child:Consumer(builder: (context, watch, child) {
                        return Padding(
                padding: const EdgeInsets.all(5),
                child:StaggeredGridView.countBuilder(
                    crossAxisCount:2,
                    itemCount:12 ,
                    itemBuilder:(BuildContext context ,int itemIndex) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                            return ProductScreen(name:value.products[i].name,avatar:value.products[i].avatar,price:value.products[i].price,
                              discount:value.products[i].discount,currency:value.products[i].currency
                              ,price_final:value.products[i].price_final
                              ,price_final_text:value.products[i].price_final_text, title:value.products[i].title);
                          }));
                        },
                        child: Card(
                          color: primarycolor,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Image.network(image_url+viewmodelpopular.listDataModel[itemIndex].poster_path),
                                Card(
                                    child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(5),

                                        child:Text((viewmodelpopular.listDataModel[itemIndex].title
                                        ),
                                          style:const TextStyle(fontWeight: FontWeight.bold,color:Colors.white),),
                                        color: black
                                    )



                                )

                              ],
                            ),
                          ),
                        ),
                      );

                    },
                    staggeredTileBuilder: (int index) =>
                    new StaggeredTile.fit(1)
                )
            );


          },

          )
      )

    );

  }
}

     body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
    SizedBox(
    width:100,
    height: 50,
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: categories.length,
    itemBuilder: (context, index) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
    onTap: (){
    context.read<EcommerceProvider>().changeCategory(categories[index]);
    },

    child: Consumer<EcommerceProvider>(

    builder:(context, value, child) =>  Chip(
    backgroundColor: (value.selectedCategory==categories[index])?Colors.greenAccent:Colors.grey,
    label: Text(categories[index]),
    ),
    ),
    ),
    )
    ),
    ),
          Consumer<EcommerceProvider>(
            builder:(context, value, child) =>  SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*.8,
              child: ListView(
                children: [
                  for(int i = 0 ; i < value.products.length ; i++)
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.5,vertical: 5),
                      child: GestureDetector(
                        onTap: (){
                         Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) {
                           return ProductScreen(name:value.products[i].name,avatar:value.products[i].avatar,price:value.products[i].price,
                               discount:value.products[i].discount,currency:value.products[i].currency
                               ,price_final:value.products[i].price_final
                               ,price_final_text:value.products[i].price_final_text, title:value.products[i].title,);
                         }));
                        },
                        child: Card(
                          color: Colors.grey,
                            elevation: 6,
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 100,
                                    child: (value.products[i].avatar==null)?Image(image: AssetImage('assets/news-default.jpeg'),):
                                    Image.network(value.products[i].avatar)
                                    ,
                                  ),
                                ),
                                SizedBox(width:5,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text((value.products[i].title.length>40)?"${value.products[i].title.substring(0,40)}...":value.products[i].title)
                                    ,Text("discount:${value.products[i].discount}%",style: TextStyle(fontSize: 15,color: Colors.black54),)
                                  ],)
                              ],
                            ),
                          ),
                      ),
                      ),

                ],
              ),
            ),
          )
        ],
      ),
     );
  }
}



Column(
        children: [
          Consumer(builder: ( context, watch,  child){
            final viewmodeltoprate=watch(getTopRateData);
            return CarouselSlider.builder(itemCount:viewmodeltoprate.listDataModel.length,itemBuilder:(context, int itemIndex, int pageViewIndex){
              return GridTile(child: Image.network(image_url+viewmodeltoprate.listDataModel[itemIndex].poster_path
              ,fit: BoxFit.fill,),
                footer: Container(
                 alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  color: Colors.red.withOpacity(0.7),
                  child: Text(
                   viewmodeltoprate.listDataModel[itemIndex].title,style: const TextStyle(
                    fontWeight: FontWeight.bold,color: black,
                  ),
                  ),

                ),


              );
            }, options:
            CarouselOptions(autoPlay: true,aspectRatio: 1.5,viewportFraction: 0.7,
            height: MediaQuery.of(context).size.height/3,
                initialPage: 0
                ,reverse: false,
                autoPlayInterval: const Duration(
                    seconds: 3
                )
                ,enableInfiniteScroll:
                false,
                autoPlayAnimationDuration: const Duration(
                  microseconds: 300,

                ),
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal),
            );
          },),
          Expanded(
            child:Consumer(builder: (context, watch, child) {
              final viewmodelpopular=watch(getpopularData);
              return Padding(
                padding: const EdgeInsets.all(5),
                child:StaggeredGridView.countBuilder(
                    crossAxisCount:2,
                    itemCount:viewmodelpopular.listDataModel.length ,
                    itemBuilder:(BuildContext context ,int itemIndex) {
                      return GestureDetector(
                        onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                          return DisScreen(poster_path:viewmodelpopular.listDataModel[itemIndex].poster_path, title:viewmodelpopular.listDataModel[itemIndex].title,id:viewmodelpopular.listDataModel[itemIndex].id,backdrop_path:viewmodelpopular.listDataModel[itemIndex].poster_path, overview:viewmodelpopular.listDataModel[itemIndex].overview, vote_average:viewmodelpopular.listDataModel[itemIndex].vote_average ,original_title:viewmodelpopular.listDataModel[itemIndex].original_title,);
                        }));
                        },
                        child: Card(
                          color: primarycolor,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Image.network(image_url+viewmodelpopular.listDataModel[itemIndex].poster_path),
                                Card(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(5),

                                    child:Text((viewmodelpopular.listDataModel[itemIndex].title
                                    ),
                                    style:const TextStyle(fontWeight: FontWeight.bold,color:Colors.white),),
                                  color: black
                                  )



                                )

                              ],
                            ),
                          ),
                        ),
                      );

                    },
                    staggeredTileBuilder: (int index) =>
                    new StaggeredTile.fit(1)
                )
                );


            },

            )
          )
        ],
      )
    );
  }
}

*/
