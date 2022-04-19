import 'package:flutter/material.dart';

import '../constant.dart';

class Passwordinput extends StatelessWidget {
  IconData icon ;
  String hint ;
  TextInputType? inputType;
  TextInputAction? inputAction;
  TextEditingController?controller;

  Passwordinput({required this.icon,required this.hint, this.inputType, this.inputAction,required this.controller});


  @override
  Widget build(BuildContext context) {
    var passwordController=TextEditingController();


    Size size =MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height*0.08,
        width: size.width*0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500]?.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(icon,size: 28,
                    color: Kwhite,),
                ),

                hintText:hint,
                hintStyle:KBodyText
            ),
            controller: passwordController,
            obscureText: true,
            style:KBodyText ,
            keyboardType: inputType,
            textInputAction: inputAction,
          ),
        ),
      ),
    );
  }
}

