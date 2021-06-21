import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';
class Payments extends StatefulWidget {
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      backgroundColor: kBackgroundColor,

      body: ListView.builder(
        itemBuilder: (_,index){
          return buildContainer(heightCont: height*0.08 , widthCont: width*0.8,balance: LocaleKeys.drawB.tr(), price: "466 SAR",date: "09 - 02 - 2021");
        },
        itemCount: 3,),
    );
  }

  Container buildContainer({double heightCont, double widthCont , String balance , String price , String date }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
      //padding: EdgeInsets.symmetric(vertical: 10,),
      height: heightCont,
      width: widthCont,
      decoration: BoxDecoration(color: kHomeColor,borderRadius: BorderRadius.circular(8),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(balance,style: TextStyle(color: kPrimaryColor,fontFamily: "dinnextl medium"),),
          Text(price,style: TextStyle(color: Colors.black,fontFamily: "dinnextl medium"),),
          Text(date,style: TextStyle(color: kTextColor,fontFamily: "dinnextl medium"),),

        ],),
    );
  }
}