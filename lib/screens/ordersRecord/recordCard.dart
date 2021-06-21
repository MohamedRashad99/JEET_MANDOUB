import 'package:flutter/material.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/screens/statusOrders/view.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../constants.dart';

class RecordCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return  GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StatusforEveryOrders()),
        );
      },
      child: Container(
        height: height*.26,
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child: Align(alignment: Alignment.centerLeft,
                  child: Text(LocaleKeys.dateOf.tr(),style: TextStyle(fontFamily: 'dinnextl medium',fontSize: 15),textAlign: TextAlign.start,)),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child: Align(alignment: Alignment.centerLeft,
                  child: Text('25/5/1442',style: TextStyle(fontFamily: 'dinnextl medium',fontSize: 13,color: kTextColor),textAlign: TextAlign.start,)),
            ),
            Divider(height: 2,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child: Align(alignment: Alignment.centerLeft,
                  child: Text(LocaleKeys.orderNumber.tr(),style: TextStyle(fontFamily: 'dinnextl medium',fontSize: 15),textAlign: TextAlign.start,)),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child: Align(alignment: Alignment.centerLeft,
                  child: Text('11345786800',style: TextStyle(fontFamily: 'dinnextl medium',fontSize: 13,color: kTextColor),textAlign: TextAlign.start,)),
            ),
            Divider(height: 2,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child: Align(alignment: Alignment.centerLeft,
                  child: Text(LocaleKeys.captainName.tr(),style: TextStyle(fontFamily: 'dinnextl medium',fontSize: 15),textAlign: TextAlign.start,)),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child: Align(alignment: Alignment.centerLeft,
                  child: Text('Faisal Mohammed',style: TextStyle(fontFamily: 'dinnextl medium',fontSize: 13,color: kTextColor),textAlign: TextAlign.start,)),
            ),

          ],

        ),
      ),
    );
  }
}
