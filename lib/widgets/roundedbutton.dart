import 'package:flutter/material.dart';

import '../constant.dart';
class RoundedButton extends StatelessWidget {

  String buttonName ;
  RoundedButton({ required this.buttonName});
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Container(
      height:size.height*0.08 ,
      width: size.width*0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: KBlue
      ),
      child: FlatButton(onPressed: () {

      }, child:Text(buttonName,style: KBodyText.copyWith(fontWeight: FontWeight.bold),),

      ),
    );
  }


}

