import 'package:flutter/material.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../constants.dart';


class WalletCard extends StatefulWidget {

  final String title;
  final int amount;
  final String createdAt;
  WalletCard({this.title, this.amount, this.createdAt});

  @override
  _WalletCardState createState() => _WalletCardState();
}

class _WalletCardState extends State<WalletCard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      child: Container(
        height: height * .33,
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
              widget.createdAt,
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
               LocaleKeys.amount.tr(),
             // 'dealerName',
              style: TextStyle(
                fontFamily: "dinnextl bold",
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Text(
              '${widget.amount.toString()}',
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
              LocaleKeys.bankTr.tr(),
              // 'dealerName',
              style: TextStyle(
                fontFamily: "dinnextl bold",
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Text(
              widget.title,
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
