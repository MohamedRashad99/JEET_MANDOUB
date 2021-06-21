import 'package:flutter/material.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../constants.dart';

class OrderCard extends StatefulWidget {
  final VoidCallback onTap;
  final int id;
  final String code;
  final String date;
  final String dealerName;

  OrderCard({this.onTap, this.id, this.code, this.date, this.dealerName});

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: height * .25,
        width: width*0.7,
        margin: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              LocaleKeys.dateOf.tr(),
              style: TextStyle(
                fontFamily: "dinnextl bold",
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Text(
              widget.date,
              style: TextStyle(
                fontFamily: "dinnextl medium",
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
            Divider(
              height: 1,
              color: kTextColor,
            ),
            Text(
              // TDOO:: parcel num
              LocaleKeys.orderNumber.tr(),
              style: TextStyle(
                fontFamily: "dinnextl bold",
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Text(
              widget.code,
              style: TextStyle(
                fontFamily: "dinnextl medium",
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
            Divider(
              height: 1,
              color: kTextColor,
            ),
            Text(
               LocaleKeys.captainName.tr(),
             // 'dealerName',
              style: TextStyle(
                fontFamily: "dinnextl bold",
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Text(
              widget.dealerName,
              style: TextStyle(
                fontFamily: "dinnextl medium",
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
