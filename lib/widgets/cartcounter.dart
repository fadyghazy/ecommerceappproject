import 'package:flutter/material.dart';
class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numofitems=1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 40,
          height: 32,
          child: OutlineButton(
             onPressed: (){
               if(numofitems>1) {
                 setState(() {
                   numofitems--;
                 });
               }
             },shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),child:Icon(Icons.remove),),
        ), Padding(
           padding: EdgeInsets.symmetric(horizontal: 10),
            // if our item is less than 10 then it shows 01 02 and so on
            child: Text(numofitems.toString().padLeft(2,"0"),style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),),
           ),

        SizedBox(
          width: 40,
          height: 32,
          child: OutlineButton(
            onPressed: (){
              setState(() {
                numofitems++;
              });
            },shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),child:Icon(Icons.add),),


        )
    ]
    );
  }
}
