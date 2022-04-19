import 'package:ecommerceappproject/control/API/ecommercecategoriesapi.dart';
import 'package:ecommerceappproject/control/API/ecommerceproductsapi.dart';
import 'package:ecommerceappproject/providers/authProvider.dart';
import 'package:ecommerceappproject/view/screens/homepage.dart';
import 'package:ecommerceappproject/view/screens/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
bool?  islogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var authStateChanges= FirebaseAuth.instance.currentUser;
  if(authStateChanges==null){
    islogin=false;
  }else{
    islogin=true;
  }

runApp(const MyApp());
}


class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthProvider(),),
          ChangeNotifierProvider(create: (context) => EcommerceProduct()),
          ChangeNotifierProvider(create: (context) => EcommerceCategory())

          
        ],
        child:
          MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home:  islogin == false ? LoginScreen() : MyHomePage(
         ),

    )
    );
  }
}




