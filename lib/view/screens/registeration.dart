import 'dart:ui';
import 'package:ecommerceappproject/providers/authProvider.dart';
import 'package:ecommerceappproject/view/screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '';
import '../../constant.dart';
import '../../widgets/backgroundimage.dart';
import 'homepage.dart';

class Registeration extends StatefulWidget {

  const Registeration({Key? key, required this.title}) : super(key: key);
  final String title;
    @override
  State<Registeration> createState() => _Registeration();
}

class _Registeration extends State<Registeration> {

  var userCredential;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState>formstate = GlobalKey<FormState>();
  List images = [
    "google_logo.png",
    "2-27254_twitter-logo-png-transparent-background-10241024-transparent-background.png",
    "Facebook_icon.png",


  ];

  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print("valid");
    }
    else {
      print("Not valid");
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Stack(
        children: [
          BackgroundImage(
              image: 'assets/images/pngtree-creative-e-commerce-icon-background-png-image_3727197.jpg'),
          Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                  child: Column(
                      children: [
                        SizedBox(width: size.width * 0.1,),
                        Stack(
                          children: [
                            Center(
                              child: ClipOval(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 3, sigmaY: 3),
                                  child: CircleAvatar(
                                    radius: size.width * 0.14,
                                    backgroundColor: Colors.grey[400]
                                        ?.withOpacity(0.4),
                                    child: Icon(
                                      FontAwesomeIcons.user, color: Kwhite,
                                      size: size.width * 0.08,),),
                                ),
                              ),
                            ),
                            Positioned(
                              top: size.height * 0.08,
                              left: size.width * 0.56,
                              child: Container(
                                height: size.height * 0.1,
                                width: size.width * 0.1,
                                decoration: BoxDecoration(
                                    color: KBlue,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Kwhite, width: 2)
                                ),
                                child: Icon(FontAwesomeIcons.arrowUp),
                                color: Kwhite,
                              ),
                            )
                          ],
                        ),

                        SizedBox(width: size.width * 0.1,),
                        SingleChildScrollView(
                            child: Form(
                                key: formstate,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [


                                      TextFormField(
                                        onSaved: (value) {
                                          nameController != value;
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "username cannot be null";
                                          }
                                          if (value.length < 2) {
                                            return "username cannot be less than 2 letters";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,

                                            prefixIcon: Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 20.0),
                                                child: Icon(
                                                  Icons.perm_identity, size: 28,
                                                  color: Kwhite,)
                                            ),

                                            hintText: " enter your name",
                                            hintStyle: KBodyText
                                        ),
                                        controller: nameController,
                                        style: KBodyText,
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next,
                                      ),
                                      TextFormField(
                                        onSaved: (value) {
                                          emailController != value;
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "email cannot be null";
                                          }
                                          if (value.length < 2) {
                                            return "email cannot be less than 2 letters";
                                          }

                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,

                                            prefixIcon: Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 20.0),
                                                child: Icon(
                                                  Icons.email, size: 28,
                                                  color: Kwhite,)
                                            ),

                                            hintText: " enter your Email",
                                            hintStyle: KBodyText
                                        ),
                                        controller: emailController,
                                        style: KBodyText,
                                        keyboardType: TextInputType
                                            .emailAddress,
                                        textInputAction: TextInputAction.next,
                                      ),

                                      TextFormField(
                                        onSaved: (value) {
                                          passwordController != value;
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "password cannot be null";
                                          }
                                          if (value.length < 4) {
                                            return "password cannot be less than 4 letters";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,

                                            prefixIcon: Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 20.0),
                                                child: Icon(
                                                  Icons.lock, size: 28,
                                                  color: Kwhite,)
                                            ),

                                            hintText: " enter your Password",
                                            hintStyle: KBodyText
                                        ),
                                        controller: passwordController,
                                        obscureText: true,
                                        style: KBodyText,
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.next,
                                      ),
                                      TextFormField(
                                        onSaved: (value) {
                                          passwordController != value;
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "password cannot be null";
                                          }
                                          if (value.length < 4) {
                                            return "password cannot be less than 4 letters";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,

                                            prefixIcon: Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 20.0),
                                                child: Icon(
                                                  Icons.lock, size: 28,
                                                  color: Kwhite,)
                                            ),

                                            hintText: " Confirm password",
                                            hintStyle: KBodyText
                                        ),
                                        controller: passwordController,
                                        obscureText: true,
                                        style: KBodyText,
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.done,

                                      ),
                                      SizedBox(height: 50),
                                      Container(
                                        width:MediaQuery.of(context).size.width,

                                        child: ElevatedButton(

                                            onPressed: () async {
                                              await signUp();
                                              await context.read<AuthProvider>()
                                                  .register(emailController.text,
                                                  passwordController.text,
                                                  nameController.text);
                                              Navigator.pushReplacement(context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyHomePage(
                                                         ),));
                                              print(
                                                  "you have  suceesfuly sign up your account now go to loginscreen to enter your new account ");
                                              print(userCredential.user!.email);
                                            },

                                            child: Text("Register"),style: ElevatedButton.styleFrom(primary: Colors.grey,onPrimary: Colors.redAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)
                                        ),
                                        ),),
                                      ),
                                      SizedBox(height: 100,),
                                      // Signin with email and password
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Text("Already have an  account?",
                                              style: KBodyText),
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.pushReplacement(
                                                    context, MaterialPageRoute(
                                                    builder: (
                                                        BuildContext context) {
                                                      return LoginScreen();
                                                    }));
                                              },
                                              child: Text(
                                                  "Login", style: KBodyText))
                                        ],
                                      )
                                    ]
                                )
                            )
                        )
                      ]
                  )
              )
          )
        ]
    );
  }


}