import 'package:flutter/material.dart';
import 'package:jeet/modules/rec/page.dart';
import 'package:jeet/screens/newOrders/view.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:jeet/screens/Parcels/Data/model.dart';
import 'package:jeet/screens/Parcels/Data/controller.dart';

class ChooseService extends StatefulWidget {


  @override
  _ChooseServiceState createState() => _ChooseServiceState();
}

class _ChooseServiceState extends State<ChooseService> {
  ShoworderModel _showorderModel =ShoworderModel();
  ShowOrderController _showOrderController =ShowOrderController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.only(top:10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:  Colors.white,
            ),
            height: height*0.25,
            width: width*0.4,
            child:FlatButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewOrders()));

              },
              child: Column(
                children: [
                  Image.asset("assets/images/delivery_logo.png"),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(LocaleKeys.newOrders.tr(),style: TextStyle(fontFamily: 'dinnextl bold',fontSize: 17),),
                  ),
                ],
              ),
            ),
            //

          ),
          Container(
            padding: EdgeInsets.only(top:10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:  Colors.white,
            ),
            height: height*0.25,
            width: width*0.4,
            child:FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>OrdersRecordPage ()),
                );
              },
              child: Column(
                children: [
                  Image.asset("assets/images/order_logo.png"),
                  Padding(
                    padding: const EdgeInsets.only(top:18),
                    child: Text(LocaleKeys.orderRecord.tr(),style: TextStyle(fontFamily: 'dinnextl bold',fontSize: 17),),
                  ),
                ],
              ),
            ),
            //

          ),
        ],
      ),
    );
  }
}
